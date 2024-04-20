# anysvg
Simple service for rendering sized and colored svgs


## Services

### simpleicons

```
/icon?size=16&service=simpleicons&icon=appsignal&color=DC657D
```

### octicon

```
/icon?service=octicon&icon=project-16
```

## Any SVG
```
/icon?size=16&url="http://some-domain.com/path-to-some.svg"
```


### GitHub Markdown

```
![jira](https://anysvg.io/icon?size=16&service=simpleicons&icon=jira)
```


## Development

This will start a web server on localhost:9292.

```
rackup
```


## Deployment

1. Install the AWS SAM CLI if you haven't already. You can find instructions on the [official AWS documentation](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html).

```
sam build
```

2. Deploy your application with the sam deploy --guided command:
```
sam deploy --guided
```