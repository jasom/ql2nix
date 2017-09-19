
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-html, 
   lisp_plump, lisp_common-doc,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_plump lisp_common-doc  ];
      inherit stdenv;
      systemName = "common-html";
      
      sourceProject = "${lisp-project_common-html}";
      patches = [];
      lisp_dependencies = "${lisp_plump} ${lisp_common-doc}";
      name = "lisp_common-html-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
