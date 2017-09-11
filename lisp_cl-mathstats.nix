
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mathstats, 
   lisp_cl-containers, lisp_metatilities-base,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-containers lisp_metatilities-base  ];
      inherit stdenv;
      systemName = "cl-mathstats";
      
      sourceProject = "${lisp-project_cl-mathstats}";
      patches = [];
      lisp_dependencies = "${lisp_cl-containers} ${lisp_metatilities-base}";
      name = "lisp_cl-mathstats-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
