
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-clon, 
   lisp_net-didierverna-clon-core, lisp_net-didierverna-clon-setup, lisp_net-didierverna-clon-termio,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_net-didierverna-clon-core lisp_net-didierverna-clon-setup lisp_net-didierverna-clon-termio  ];
      inherit stdenv;
      systemName = "net.didierverna.clon";
      
      sourceProject = "${lisp-project_cl-clon}";
      patches = [];
      lisp_dependencies = "${lisp_net-didierverna-clon-core} ${lisp_net-didierverna-clon-setup} ${lisp_net-didierverna-clon-termio}";
      name = "lisp_net-didierverna-clon0b24";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
