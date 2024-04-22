# AnySVG

AnySVG is a service that allows you to fetch SVG icons from various sources and use them in your applications. It supports Simple Icons, GitHub Octicons, and Bootstrap Icons.

## Usage

To use AnySVG, you make a GET request to the service endpoint with the appropriate parameters.

### Simple Icons

To fetch a Simple Icon, use the following format:

```
/si/{size}/{icon}?color={color}
```

Replace `{size}` with the desired size of the icon, `{icon}` with the name of the icon, and `{color}` with the desired color (in hex format without the `#`).

### GitHub Octicons

To fetch a GitHub Octicon, use the following format:

```
/gh/{size}/{icon}?color={color}
```

Replace `{size}` with the desired size of the icon, `{icon}` with the name of the icon, and `{color}` with the desired color (in hex format without the `#`).

### Bootstrap Icons

To fetch a Bootstrap Icon, use the following format:

```
/bs/{size}/{icon}?color={color}
```

Replace `{size}` with the desired size of the icon, `{icon}` with the name of the icon, and `{color}` with the desired color (in hex format without the `#`).

## Examples

Here are some examples of how to use AnySVG in a Markdown document:

### Simple Icons

```markdown
![jira](https://anysvg.io/si/24/jira?color=ff0000)
```

### GitHub Octicons

```markdown
![project](https://anysvg.io/gh/16/project?color=ff0000)
```

### Bootstrap Icons

```markdown
![alarm](https://anysvg.io/bs/24/alarm-fill?color=ff0000)
```

Please replace `https://anysvg.io` with the actual URL of your AnySVG service.