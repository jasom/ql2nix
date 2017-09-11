
{ buildLispPackage, stdenv, fetchurl, lisp-project_net-telent-date, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "net-telent-date";
      
      sourceProject = "${lisp-project_net-telent-date}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_net-telent-date_0.42";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
