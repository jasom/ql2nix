
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-clon, 
   lisp_cffi-grovel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "net.didierverna.clon.termio";
      
      sourceProject = "${lisp-project_cl-clon}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel}";
      name = "lisp_net-didierverna-clon-termio0b24";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
