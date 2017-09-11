
{ buildLispPackage, stdenv, fetchurl, lisp-project_local-time-duration, 
   lisp_local-time, lisp_esrap,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_esrap  ];
      inherit stdenv;
      systemName = "local-time-duration";
      
      sourceProject = "${lisp-project_local-time-duration}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_esrap}";
      name = "lisp_local-time-duration-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
