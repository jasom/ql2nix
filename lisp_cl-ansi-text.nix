
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ansi-text, 
   lisp_cl-colors,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-colors  ];
      inherit stdenv;
      systemName = "cl-ansi-text";
      
      sourceProject = "${lisp-project_cl-ansi-text}";
      patches = [];
      lisp_dependencies = "${lisp_cl-colors}";
      name = "lisp_cl-ansi-text-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
