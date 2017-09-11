
{ buildLispPackage, stdenv, fetchurl, lisp-project_diff, 
   lisp_cl-ppcre, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "diff";
      
      sourceProject = "${lisp-project_diff}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_trivial-gray-streams}";
      name = "lisp_diff-20130813-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
