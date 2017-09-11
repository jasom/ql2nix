
{ buildLispPackage, stdenv, fetchurl, lisp-project_dartsclmessagepack, 
   lisp_babel, lisp_ieee-floats,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_ieee-floats  ];
      inherit stdenv;
      systemName = "darts.lib.message-pack";
      
      sourceProject = "${lisp-project_dartsclmessagepack}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_ieee-floats}";
      name = "lisp_darts-lib-message-pack-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
