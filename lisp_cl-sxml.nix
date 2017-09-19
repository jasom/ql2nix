
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sxml, 
   lisp_cxml,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml  ];
      inherit stdenv;
      systemName = "cl-sxml";
      
      sourceProject = "${lisp-project_cl-sxml}";
      patches = [];
      lisp_dependencies = "${lisp_cxml}";
      name = "lisp_cl-sxml-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
