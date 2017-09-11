
{ buildLispPackage, stdenv, fetchurl, lisp-project_colorize, 
   lisp_html-encode, lisp_split-sequence, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_html-encode lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "colorize";
      
      sourceProject = "${lisp-project_colorize}";
      patches = [];
      lisp_dependencies = "${lisp_html-encode} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_colorize-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
