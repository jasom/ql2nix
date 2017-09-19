
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ixf, 
   lisp_ieee-floats, lisp_cl-ppcre, lisp_local-time, lisp_babel, lisp_alexandria, lisp_md5, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ieee-floats lisp_cl-ppcre lisp_local-time lisp_babel lisp_alexandria lisp_md5 lisp_split-sequence  ];
      inherit stdenv;
      systemName = "ixf";
      
      sourceProject = "${lisp-project_cl-ixf}";
      patches = [];
      lisp_dependencies = "${lisp_ieee-floats} ${lisp_cl-ppcre} ${lisp_local-time} ${lisp_babel} ${lisp_alexandria} ${lisp_md5} ${lisp_split-sequence}";
      name = "lisp_ixf-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
