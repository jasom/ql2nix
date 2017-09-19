
{ buildLispPackage, stdenv, fetchurl, lisp-project_zaws, 
   lisp_ironclad, lisp_drakma, lisp_cl-base64,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_drakma lisp_cl-base64  ];
      inherit stdenv;
      systemName = "zaws";
      
      sourceProject = "${lisp-project_zaws}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_drakma} ${lisp_cl-base64}";
      name = "lisp_zaws-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
