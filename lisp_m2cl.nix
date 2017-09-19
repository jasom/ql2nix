
{ buildLispPackage, stdenv, fetchurl, lisp-project_m2cl, 
   lisp_zmq, lisp_salza2, lisp_flexi-streams, lisp_cl-ppcre, lisp_cl-json, lisp_babel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_zmq lisp_salza2 lisp_flexi-streams lisp_cl-ppcre lisp_cl-json lisp_babel  ];
      inherit stdenv;
      systemName = "m2cl";
      
      sourceProject = "${lisp-project_m2cl}";
      patches = [];
      lisp_dependencies = "${lisp_zmq} ${lisp_salza2} ${lisp_flexi-streams} ${lisp_cl-ppcre} ${lisp_cl-json} ${lisp_babel}";
      name = "lisp_m2cl-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
