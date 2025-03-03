import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

const HomePage = () => {
  return (
    <div className=" border border-red-500 rounded-xl bg-black p-5">
      <h1 className="text-red-500 p-5">Hello World!</h1>
      <Button> ok </Button>
      <Input />
    </div>
  );
};

export default HomePage;
