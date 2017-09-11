
{ buildLispPackage, stdenv, fetchurl, lisp-project_json-mop, 
   lisp_json-mop, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_json-mop lisp_fiveam  ];
      inherit stdenv;
      systemName = "json-mop-tests";
      
      sourceProject = "${lisp-project_json-mop}";
      patches = [];
      lisp_dependencies = "${lisp_json-mop} ${lisp_fiveam}";
      name = "lisp_json-mop-tests-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
