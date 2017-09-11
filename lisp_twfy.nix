
{ buildLispPackage, stdenv, fetchurl, lisp-project_twfy, 
   lisp_cl-json, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_drakma  ];
      inherit stdenv;
      systemName = "twfy";
      
      sourceProject = "${lisp-project_twfy}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_drakma}";
      name = "lisp_twfy-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
