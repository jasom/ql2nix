
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-odesk, 
   lisp_alexandria, lisp_cl-ppcre, lisp_drakma, lisp_iterate, lisp_md5, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_drakma lisp_iterate lisp_md5 lisp_split-sequence  ];
      inherit stdenv;
      systemName = "odesk";
      
      sourceProject = "${lisp-project_cl-odesk}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_drakma} ${lisp_iterate} ${lisp_md5} ${lisp_split-sequence}";
      name = "lisp_odesk-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
