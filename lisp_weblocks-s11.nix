
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks, 
   lisp_arnesi, lisp_weblocks-util, lisp_weblocks,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arnesi lisp_weblocks-util lisp_weblocks  ];
      inherit stdenv;
      systemName = "weblocks-s11";
      
      sourceProject = "${lisp-project_weblocks}";
      patches = [];
      lisp_dependencies = "${lisp_arnesi} ${lisp_weblocks-util} ${lisp_weblocks}";
      name = "lisp_weblocks-s11-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
