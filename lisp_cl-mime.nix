
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mime, 
   lisp_cl-qprint, lisp_cl-base64, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-qprint lisp_cl-base64 lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-mime";
      
      sourceProject = "${lisp-project_cl-mime}";
      patches = [];
      lisp_dependencies = "${lisp_cl-qprint} ${lisp_cl-base64} ${lisp_cl-ppcre}";
      name = "lisp_cl-mime-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
