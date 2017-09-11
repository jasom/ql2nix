
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks, 
   lisp_weblocks-util, lisp_weblocks, lisp_lift, lisp_weblocks-prototype-js,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks-util lisp_weblocks lisp_lift lisp_weblocks-prototype-js  ];
      inherit stdenv;
      systemName = "weblocks-test";
      
      sourceProject = "${lisp-project_weblocks}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks-util} ${lisp_weblocks} ${lisp_lift} ${lisp_weblocks-prototype-js}";
      name = "lisp_weblocks-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
