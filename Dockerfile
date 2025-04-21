# 构建阶段
FROM openjdk:17-slim AS build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD .  WORKDIR
RUN chmod +x mvnw  # 添加执行权限
RUN --mount=type=cache,target=/root/.m2 ./mvnw -f pom.xml clean package  # 使用相对路径

# 运行阶段
FROM openjdk:17-slim
COPY --from=build /usr/app/target/*.jar /app/runner.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app/runner.jar"]