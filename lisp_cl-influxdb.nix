
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-influxdb, 
   lisp_cl-annot, lisp_do-urlencode, lisp_drakma, lisp_cl-json,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-annot lisp_do-urlencode lisp_drakma lisp_cl-json  ];
      inherit stdenv;
      systemName = "cl-influxdb";
      
      sourceProject = "${lisp-project_cl-influxdb}";
      patches = [];
      lisp_dependencies = "${lisp_cl-annot} ${lisp_do-urlencode} ${lisp_drakma} ${lisp_cl-json}";
      name = "lisp_cl-influxdb-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
