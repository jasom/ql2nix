
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-examples, 
   lisp_weblocks, lisp_weblocks-prevalence,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks lisp_weblocks-prevalence  ];
      inherit stdenv;
      systemName = "simple-blog";
      
      sourceProject = "${lisp-project_weblocks-examples}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks} ${lisp_weblocks-prevalence}";
      name = "lisp_simple-blog-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
