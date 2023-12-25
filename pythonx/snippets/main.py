# vim:set et fileencoding=utf8 sts=0 sw=4 ts=4:

"""Helper methods used in UltiSnips snippets."""

import string, vim, re


def _parse_comments(s):
    """Parses vim's comments option to extract comment format"""
    i = iter(s.split(","))

    rv = []
    try:
        while True:
            # get the flags and text of a comment part
            flags, text = next(i).split(":", 1)

            if len(flags) == 0:
                rv.append(("OTHER", text, text, text, ""))
            # parse 3-part comment, but ignore those with O flag
            elif "s" in flags and "O" not in flags:
                ctriple = ["TRIPLE"]
                indent = ""

                if flags[-1] in string.digits:
                    indent = " " * int(flags[-1])
                ctriple.append(text)

                flags, text = next(i).split(":", 1)
                assert flags[0] == "m"
                ctriple.append(text)

                flags, text = next(i).split(":", 1)
                assert flags[0] == "e"
                ctriple.append(text)
                ctriple.append(indent)

                rv.append(ctriple)
            elif "b" in flags:
                if len(text) == 1:
                    rv.insert(0, ("SINGLE_CHAR", text, text, text, ""))
    except StopIteration:
        return rv


def box_comment(line: str):
    commentstring = vim.eval("&commentstring")
    if commentstring.endswith("%s"):
        c = commentstring[:-2]
        return (c.rstrip(), "")

    c = commentstring.split("%s")
    if line == "top":
        return (c[0], "")

    if line == "mid":
        return (" " * len(c[0]), "")

    if line == "bot":
        return (" " * len(c[0]), c[1])

    return ("", "")
