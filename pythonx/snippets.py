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


def get_comment_format():
    commentstring = vim.eval("&commentstring")
    if commentstring.endswith("%s"):
        c = commentstring[:-2]
        return (c.rstrip(), c.rstrip(), c.rstrip(), "")
    comments = _parse_comments(vim.eval("&comments"))
    for c in comments:
        if c[0] == "SINGLE_CHAR":
            return c[1:]
    return comments[0][1:]


def comment():
    commentstring = vim.eval("&commentstring")
    if commentstring.endswith("%s"):
        c = commentstring[:-2]
        return (c.rstrip(), "")
    elif "%s" in commentstring:
        c = commentstring.split("%s")
        return (c[0], c[1])

    comments = _parse_comments(vim.eval("&comments"))
    for c in comments:
        if c[0] == "SINGLE_CHAR":
            return c[1:][0]
    return comments[0][1:]
