---
title: JSX element type 'Component' does not have any construct or call signatures
description: 
date: 2020-06-12
tags:
  - React
  - Troubleshooting
draft: false
---
React로 인증 조건에 따라 렌더링하는 PrivateRoute 구현 중 아래와 같은 에러 발생

```
JSX 요소 형식 'Component'에 구문 또는 호출 시그니처가 없습니다.ts(2604)
// JSX element type 'Component' does not have any construct or call signatures. [2604]
```

![](https://blog.kakaocdn.net/dn/cvWJlf/btqENAvKsnn/j4x9To2rN14zoDcODyqqd0/img.png)

react-router-dom `RouteProps` 인터페이스에서 `component` 가 optional 이기 때문에 TS2604 에러가 난다.

```js
export interface RouteProps {
    location?: H.Location;
    component?: React.ComponentType<RouteComponentProps<any>> | React.ComponentType<any>;
    render?: (props: RouteComponentProps<any>) => React.ReactNode;
    children?: ((props: RouteChildrenProps<any>) => React.ReactNode) | React.ReactNode;
    path?: string | string[];
    exact?: boolean;
    sensitive?: boolean;
    strict?: boolean;
}
```

`component` 가 있는지를 먼저 체크해주는 코드를 두면 에러가 나지 않는다.

```js
/* eslint-disable react/jsx-props-no-spreading */
import React from "react";
// eslint-disable-next-line no-unused-vars
import { Route, RouteProps } from "react-router-dom";

interface Props extends RouteProps {
  isAuthenticated: boolean;
}

function PrivateRoute({
  component: Component,
  isAuthenticated,
  ...rest
}: Props) {
  if (!Component) return null;
  return (
    <Route
      {...rest}
      render={(props) => {
        if (isAuthenticated) {
          return <Component {...props} />;
        }
        return <p>Not Authenticated</p>;
      }}
    />
  );
}

export default PrivateRoute;
```

하지만 RouteProps 인터페이스에 인증 여부만 추가할 거면 Route의 기능을 그대로 사용하는 게 좋을 것 같다.  
   
1. Composition 방식으로 구현

```js
/* eslint-disable react/jsx-props-no-spreading */
import React from "react";
// eslint-disable-next-line no-unused-vars
import { Route, RouteProps } from "react-router-dom";

interface Props extends RouteProps {
  isAuthenticated: boolean;
}

function PrivateRoute({
  component,
  children,
  isAuthenticated,
  ...rest
}: Props) {
  if (isAuthenticated) {
    return (
      <Route {...rest} component={component}>
        {children}
      </Route>
    );
  }
  return <p>Not Authenticated</p>;
}

export default PrivateRoute;
```

2. Inheritance 방식으로 구현

```js
/* eslint-disable react/jsx-props-no-spreading */
import React from "react";
// eslint-disable-next-line no-unused-vars
import { Route, RouteProps, RouteComponentProps } from "react-router-dom";

interface Props extends RouteProps {
  isAuthenticated: boolean;
}

class PrivateRoute extends Route<Props> {
  render() {
    if (this.props.isAuthenticated) {
      return super.render();
    }
    return <h1>Not Authenticated</h1>;
  }
}

export default PrivateRoute;
```

