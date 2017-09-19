
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-messagepack, 
   lisp_closer-mop, lisp_fiveam, lisp_cl-json, lisp_babel, lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_fiveam lisp_cl-json lisp_babel lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "cl-messagepack";
      
      sourceProject = "${lisp-project_cl-messagepack}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_fiveam} ${lisp_cl-json} ${lisp_babel} ${lisp_flexi-streams}";
      name = "lisp_cl-messagepack-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
