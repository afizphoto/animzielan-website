import Site from '../../lib/site';

export const metadata = {title:'Portfolio',alternates:{canonical:'/portfolio'}};

export default function Page() {
  return <Site page={'portfolio'}/>;
}
