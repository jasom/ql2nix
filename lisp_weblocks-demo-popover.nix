
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks, 
   lisp_weblocks-util, lisp_weblocks, lisp_weblocks-prevalence,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks-util lisp_weblocks lisp_weblocks-prevalence  ];
      inherit stdenv;
      systemName = "weblocks-demo-popover";
      
      sourceProject = "${lisp-project_weblocks}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks-util} ${lisp_weblocks} ${lisp_weblocks-prevalence}";
      name = "lisp_weblocks-demo-popover-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
