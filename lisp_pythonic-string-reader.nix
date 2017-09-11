
{ buildLispPackage, stdenv, fetchurl, lisp-project_pythonic-string-reader, 
   lisp_named-readtables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables  ];
      inherit stdenv;
      systemName = "pythonic-string-reader";
      
      sourceProject = "${lisp-project_pythonic-string-reader}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables}";
      name = "lisp_pythonic-string-reader-20120703-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
