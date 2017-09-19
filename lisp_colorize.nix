
{ buildLispPackage, stdenv, fetchurl, lisp-project_colorize, 
   lisp_alexandria, lisp_split-sequence, lisp_html-encode,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_split-sequence lisp_html-encode  ];
      inherit stdenv;
      systemName = "colorize";
      
      sourceProject = "${lisp-project_colorize}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_split-sequence} ${lisp_html-encode}";
      name = "lisp_colorize-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
