
{ buildLispPackage, stdenv, fetchurl, lisp-project_lass, 
   lisp_trivial-indent, lisp_trivial-mimes, lisp_cl-base64,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-indent lisp_trivial-mimes lisp_cl-base64  ];
      inherit stdenv;
      systemName = "lass";
      
      sourceProject = "${lisp-project_lass}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-indent} ${lisp_trivial-mimes} ${lisp_cl-base64}";
      name = "lisp_lass-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
