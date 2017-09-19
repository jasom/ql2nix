
{ buildLispPackage, stdenv, fetchurl, lisp-project_m2cl, 
   lisp_zmq, lisp_salza2, lisp_flexi-streams, lisp_cl-ppcre, lisp_cl-json, lisp_babel, lisp_bordeaux-threads,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_zmq lisp_salza2 lisp_flexi-streams lisp_cl-ppcre lisp_cl-json lisp_babel lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "m2cl-examples";
      
      sourceProject = "${lisp-project_m2cl}";
      patches = [];
      lisp_dependencies = "${lisp_zmq} ${lisp_salza2} ${lisp_flexi-streams} ${lisp_cl-ppcre} ${lisp_cl-json} ${lisp_babel} ${lisp_bordeaux-threads}";
      name = "lisp_m2cl-examples-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
