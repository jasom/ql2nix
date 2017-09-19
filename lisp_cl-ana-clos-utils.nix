
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_split-sequence, lisp_alexandria, lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_alexandria lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-ana.clos-utils";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_alexandria} ${lisp_closer-mop}";
      name = "lisp_cl-ana-clos-utils-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
