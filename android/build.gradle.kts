allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Change root build directory
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    layout.buildDirectory.set(newSubprojectBuildDir)
}

// If you need something from :app, use afterEvaluate or direct project reference
subprojects {
    afterEvaluate {
        if (project.name != "app") {
            val appProject = rootProject.findProject(":app")
            // Example: read a property from :app if needed
            // val appVersion = appProject?.extensions.findByType<com.android.build.gradle.AppExtension>()?.defaultConfig?.versionName
        }
    }
}

// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
