
{ buildLispPackage, stdenv, fetchurl, lisp-project_json-streams, 
   lisp_cl-quickcheck, lisp_flexi-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-quickcheck lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "json-streams-tests";
      
      sourceProject = "${lisp-project_json-streams}";
      patches = [];
      lisp_dependencies = "${lisp_cl-quickcheck} ${lisp_flexi-streams}";
      name = "lisp_json-streams-tests-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
