Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u54Ab-0003rt-9C
	for mharc-qemu-rust@gnu.org; Wed, 16 Apr 2025 10:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u54AZ-0003rT-19
 for qemu-rust@nongnu.org; Wed, 16 Apr 2025 10:55:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u54AW-0002UR-LP
 for qemu-rust@nongnu.org; Wed, 16 Apr 2025 10:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744815314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8k4hbvnVBE5NT46pE/eA216fxOP0iSRwhvbt2nPxxSA=;
 b=XHXNS7Dff7Uu2civ3rkWNlcmj7obs9YbadM0e7IqzybwQvbBXpBuaEL0nr7rYJjEO48iSP
 0iKNG1Xftd3U1783UkoeEbb0YV0inUmnAt1tzbxp20/W4g+Tyjj+qstiuyP+a0iFm9Jxa9
 NLZ3W0TUnNRMhoceVbgiMFiO5kDTX0E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-lc8eakuoMaynm9IjNCvxxA-1; Wed, 16 Apr 2025 10:55:13 -0400
X-MC-Unique: lc8eakuoMaynm9IjNCvxxA-1
X-Mimecast-MFC-AGG-ID: lc8eakuoMaynm9IjNCvxxA_1744815312
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d08915f61so40677465e9.2
 for <qemu-rust@nongnu.org>; Wed, 16 Apr 2025 07:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744815312; x=1745420112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8k4hbvnVBE5NT46pE/eA216fxOP0iSRwhvbt2nPxxSA=;
 b=W3sDp7PQhqWwoDlD7bCgWRbJ+htIS7Ikyc1NFHriTMK3COM1wM/M9OSxR9TL0hWRO1
 R2smad2ZSHvn1f2nto7/m/qtbkx9l65GnPOn5SYXjMiLJaziQC64e240Me2josVnMJ72
 XnKxvvoyP4WsFXeMeLXP7rTVcEzcZqQ+sWzeYOIpbwGMhBzJ9/VG+zwnSpTGb49xGsVZ
 55GMTAV4C320NFZmhjvEXhSmBkVUy7qVtxMPkcwJRd5nBPfiaR8nGHdV4nAGrdTSAo9p
 K2kAwO7nGJUR0iBRXmHN7fFnSsdd9pQryzyuBQJitH71iXJ+dKlQkkEVxq+b49iWWIw0
 Mnew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgA2bMNgAtnG7dR6yNtT90P6u56YI0JJu4iYA+bIzBuOx9/IvqIyW+RKbevCMmHXelsz9zbeeQYlc=@nongnu.org
X-Gm-Message-State: AOJu0YzhRrn1l2xV+g64lvyVN6fch+W8xD6fbp00MWakbORZ49xlxj9y
 VUD9Tse15l943DWVTjLukkul7vGAjG0mnq70dtkdj5OsCv2vdFM7r/RxVG4qA6Hz1ghrdNqY07w
 +6aRhpJ5/eT6kakIkmCujf1Zmy8CHBoJ/uCOGz6gKCka0hbsJy85HE6H55Lo5OO3rv66jonw/Nx
 x1DH815ew8y6UP7wN89ntaSdsCJQ==
X-Gm-Gg: ASbGnctvsgWBlg5Mch+izPg5FFRYzW5RUfN2JeRCeky9WBnFUirYLucT1ikUJ+INjpE
 APHMzWBAuPlmPvC3xSGcLqCSj7vjQuuJXG8uW0sWO3PKcGaHsO7P7sTMzsvwxIMuWlXc6Ew==
X-Received: by 2002:a05:6000:2403:b0:39e:cbca:7156 with SMTP id
 ffacd0b85a97d-39ee5b13b8amr2330426f8f.1.1744815312222; 
 Wed, 16 Apr 2025 07:55:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVS6kT7x/9sfaEfRsEirgQyobPpFesppbcThOD6gcb1m5d4F3BLdw1KKLu5RUcPvvCyxijsL8Qg+awn9nPSSw=
X-Received: by 2002:a05:6000:2403:b0:39e:cbca:7156 with SMTP id
 ffacd0b85a97d-39ee5b13b8amr2330411f8f.1.1744815311844; Wed, 16 Apr 2025
 07:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250414144943.1112885-1-zhao1.liu@intel.com>
 <20250414144943.1112885-2-zhao1.liu@intel.com>
In-Reply-To: <20250414144943.1112885-2-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 16 Apr 2025 16:54:59 +0200
X-Gm-Features: ATxdqUFv8219Hv1r0jg_CXUGgNLFkj4kgOR8-kXLqbOIkNEdVzAyBECRRYXQqLw
Message-ID: <CABgObfY8GfLZ5WJwRKTKGTb=qs4-QxsXb9=L9E4z8d9D8AoCJg@mail.gmail.com>
Subject: Re: [PATCH 1/9] rust/vmstate: Support field_exists check in
 vmstate_struct macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Dapeng Mi <dapeng1.mi@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l9mTcoPFyJdGhruvsidzaD07CutGmlpjWotAsy2_LXE_1744815312
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2025 14:55:19 -0000

On Mon, Apr 14, 2025 at 4:29=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> Unfortunately, at present it's not possible to have a const
> "with_exist_check" method to append test_fn after vmstate_struct (due
> to error on "constant functions cannot evaluate destructors" for `F`).

Nothing that std::mem::forget() can't fix. ;) We know that the
destructor is a no-op because FnCall is only implemented on zero-sized
functions.

Another problem with such a method, however, is that you need
VMStateField<T> for it to be type-safe. Implementing it on
bindings::VMStateField gives no guarantee that the type of the
argument to the function is the correct one. So this patch is okay
too, but perhaps add a comment (not necessarily a doc comment)
mentioning that VMStateField<T> is planned in order to remove the
extra argument?

Thanks,

Paolo


