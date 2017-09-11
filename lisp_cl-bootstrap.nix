
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bootstrap, 
   lisp_cl-who, lisp_parenscript,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who lisp_parenscript  ];
      inherit stdenv;
      systemName = "cl-bootstrap";
      
      sourceProject = "${lisp-project_cl-bootstrap}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who} ${lisp_parenscript}";
      name = "lisp_cl-bootstrap-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
