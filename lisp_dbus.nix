
{ buildLispPackage, stdenv, fetchurl, lisp-project_dbus, 
   lisp_ironclad, lisp_cl-xmlspam, lisp_flexi-streams, lisp_ieee-floats, lisp_iolib, lisp_babel, lisp_trivial-garbage, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_cl-xmlspam lisp_flexi-streams lisp_ieee-floats lisp_iolib lisp_babel lisp_trivial-garbage lisp_alexandria  ];
      inherit stdenv;
      systemName = "dbus";
      
      sourceProject = "${lisp-project_dbus}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_cl-xmlspam} ${lisp_flexi-streams} ${lisp_ieee-floats} ${lisp_iolib} ${lisp_babel} ${lisp_trivial-garbage} ${lisp_alexandria}";
      name = "lisp_dbus-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
