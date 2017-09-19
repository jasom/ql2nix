
{ buildLispPackage, stdenv, fetchurl, lisp-project_lass, 
   lisp_cl-base64, lisp_trivial-mimes, lisp_trivial-indent,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_trivial-mimes lisp_trivial-indent  ];
      inherit stdenv;
      systemName = "binary-lass";
      
      sourceProject = "${lisp-project_lass}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_trivial-mimes} ${lisp_trivial-indent}";
      name = "lisp_binary-lass-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
