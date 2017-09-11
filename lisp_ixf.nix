
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ixf, 
   lisp_split-sequence, lisp_md5, lisp_alexandria, lisp_babel, lisp_local-time, lisp_cl-ppcre, lisp_ieee-floats,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_md5 lisp_alexandria lisp_babel lisp_local-time lisp_cl-ppcre lisp_ieee-floats  ];
      inherit stdenv;
      systemName = "ixf";
      
      sourceProject = "${lisp-project_cl-ixf}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_md5} ${lisp_alexandria} ${lisp_babel} ${lisp_local-time} ${lisp_cl-ppcre} ${lisp_ieee-floats}";
      name = "lisp_ixf-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
