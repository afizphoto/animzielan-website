import Site from '../../lib/site';

export const metadata = {title:'Media Gallery',alternates:{canonical:'/gallery'}};

export default function Page() {
  return <Site page={'gallery'}/>;
}
