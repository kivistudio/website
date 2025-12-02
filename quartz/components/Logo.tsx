import { pathToRoot, joinSegments } from "../util/path"
import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { classNames } from "../util/lang"

const Logo: QuartzComponent = ({ fileData, cfg, displayClass }: QuartzComponentProps) => {
  const baseDir = pathToRoot(fileData.slug!)
  const iconPath = joinSegments(baseDir, "static/icon.png")
  const title = cfg?.pageTitle ?? "Home"
  
  return (
    <div class={classNames(displayClass, "logo")}>
      <a href={baseDir}>
        <img src={iconPath} alt={title} />
      </a>
    </div>
  )
}

Logo.css = `
.logo {
  display: flex;
  align-items: center;
  justify-content: center;
}

.logo img {
  height: 72px;
  width: 72px;
  object-fit: contain;
  margin: 0;
  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.logo a {
  display: block;
  line-height: 0;
}

.logo a:hover img {
  transform: scale(1.08);
}

@media (max-width: 800px) {
  .logo img {
    height: 56px;
    width: 56px;
  }
}
`

export default (() => Logo) satisfies QuartzComponentConstructor

