
{ buildLispPackage, stdenv, fetchurl, lisp-project_zaws, 
   lisp_cl-base64, lisp_drakma, lisp_flexi-streams, lisp_ironclad,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_drakma lisp_flexi-streams lisp_ironclad  ];
      inherit stdenv;
      systemName = "zaws";
      
      sourceProject = "${lisp-project_zaws}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_drakma} ${lisp_flexi-streams} ${lisp_ironclad}";
      name = "lisp_zaws-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
