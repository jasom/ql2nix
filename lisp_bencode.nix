
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bencode, 
   lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "bencode";
      
      sourceProject = "${lisp-project_cl-bencode}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams}";
      name = "lisp_bencode-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
