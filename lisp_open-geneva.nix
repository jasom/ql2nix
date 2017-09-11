
{ buildLispPackage, stdenv, fetchurl, lisp-project_geneva, 
   lisp_geneva, lisp_geneva-cl, lisp_geneva-html, lisp_geneva-latex, lisp_geneva-mk2, lisp_geneva-plain-text, lisp_geneva-tex,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_geneva lisp_geneva-cl lisp_geneva-html lisp_geneva-latex lisp_geneva-mk2 lisp_geneva-plain-text lisp_geneva-tex  ];
      inherit stdenv;
      systemName = "open-geneva";
      
      sourceProject = "${lisp-project_geneva}";
      patches = [];
      lisp_dependencies = "${lisp_geneva} ${lisp_geneva-cl} ${lisp_geneva-html} ${lisp_geneva-latex} ${lisp_geneva-mk2} ${lisp_geneva-plain-text} ${lisp_geneva-tex}";
      name = "lisp_open-geneva-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
