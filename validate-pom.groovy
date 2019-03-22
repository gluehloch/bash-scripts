def red() {
    print "\033[31;1m"
}

def yellow() {
    print "\033[33m"
}

def green() {
    print "\033[32m"
}

def reset() {
    print "\033[0m"
}

green()
println """
///
/// AWTools
///     Start POM Checker ...
///
"""
reset()

def fg = 30
def bg = 46
def style = "${(char)27}[$fg;$bg"+"m"

def pomAsFile = new File("pom.xml")
def pom = new XmlSlurper().parse(pomAsFile)

def derivedGroupId = pom.groupId?.text() ?: pom.parent.groupId

def enableWarning = false

println "Parent POM...: ${pom.parent.groupId}:${pom.parent.artifactId}:${pom.parent.version}"
if (pom.version.toString().contains('SNAPSHOT')) {
    yellow()
}
println "Project POM..: ${derivedGroupId}:${pom.artifactId}:${pom.version}"
reset()

println ""
println "Dependencies:"
pom.dependencies.dependency.each { dependency ->
    if (dependency.version.toString().contains('SNAPSHOT')) {
        yellow()
        enableWarning = true
    }
    println "    ${dependency.groupId}:${dependency.artifactId}:${dependency.version}"
    reset()
}

println ""

// TODO Are there uncommited changes?
def sout = new StringBuilder()
def serr = new StringBuilder()
def proc = 'git status'.execute()
proc.consumeProcessOutput(sout, serr)
proc.waitForOrKill(1000)
if (sout.toString().contains('git add')) {
    yellow()
    println "Git repository:"
    println "    Uncommited changes! Check with git status."
}
// println "out> $sout err> $serr"

if (enableWarning) {
    red()
    println """
///  Check you dependencies!
"""
    reset()
} else {
    println "Release me!"
}

// Check: changes.xml No ??-?? dates declated?
// Check: Expected version defined? Take version as parameter.
