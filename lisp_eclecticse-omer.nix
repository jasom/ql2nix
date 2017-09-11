
{ buildLispPackage, stdenv, fetchurl, lisp-project_omer-count, 
   lisp_local-time,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time  ];
      inherit stdenv;
      systemName = "eclecticse.omer";
      
      sourceProject = "${lisp-project_omer-count}";
      patches = [];
      lisp_dependencies = "${lisp_local-time}";
      name = "lisp_eclecticse-omer-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
