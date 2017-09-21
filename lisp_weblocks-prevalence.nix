
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_weblocks-util, lisp_bordeaux-threads, lisp_cl-prevalence, lisp_cl-ppcre, lisp_metatilities,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks-util lisp_bordeaux-threads lisp_cl-prevalence lisp_cl-ppcre lisp_metatilities  ];
      inherit stdenv;
      systemName = "weblocks-prevalence";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks-util} ${lisp_bordeaux-threads} ${lisp_cl-prevalence} ${lisp_cl-ppcre} ${lisp_metatilities}";
      name = "lisp_weblocks-prevalence-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }