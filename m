Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJJHV-0006rl-IN
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 16:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJJHU-0006r8-56
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 16:21:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJJHS-0004or-Jv
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 16:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733433661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43Lc1qkqIGe8YXJdAU6bbqzg75+1s7x6Dpw0bghVJn4=;
 b=emJ93fW9DFrknot6M+P2QPuhV8nZiprdKVT7miDnKvQMjENafeuiM0XAdbMJ3MAvto0Yid
 lSY5r0p+Ef1c6mxqflrk/Imp8wGXz7HTecU8oueRy1ACNi58VYQt7g9GSNkM5Lh5EDWiht
 mPY1N/n6YunHxvkwOm5/+lych3Az2u0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-4yMbt9nINlumCgkIbmK8mA-1; Thu, 05 Dec 2024 16:21:00 -0500
X-MC-Unique: 4yMbt9nINlumCgkIbmK8mA-1
X-Mimecast-MFC-AGG-ID: 4yMbt9nINlumCgkIbmK8mA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4349d895ef8so13346945e9.0
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 13:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733433659; x=1734038459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43Lc1qkqIGe8YXJdAU6bbqzg75+1s7x6Dpw0bghVJn4=;
 b=p8p6ZYg3nTM9NVCy9q9OGtf8cm1kVN4r10Pl8rNaVrpF7K6FGVUNgQbCXDqELsoTJJ
 FEwtr0Eg+5L6U4nXVsHePW53JSLbsgDbA6na0VDrZLAxi2GjgthuGWpmU5XzD0hHoJFq
 zRt9ce1QUL/k6zq7EXUhpR0viOms7s24o5z5Pv7WFrk5zY0X4JumhClCr2UZndbubgnf
 kY0ChG52q3vplZOT48jvuBEQ6iuvzcKhZD5BRvv5jk4Oum24doMpZ5B7u20sOqWXVwSy
 7E379f5lvmOTfAKKYMdFuzHelcEABLB+QS5rQlw8AixtqdhKe4yuYVb9a9kPbsO2+Su0
 yAIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSHD44cu1cUanoxROmYlL9pSqI3NhrjKjpEfBNzmom7N0Oc8dEhGojF4w1fDsScS6x2sVxbHbGUqc=@nongnu.org
X-Gm-Message-State: AOJu0YxQFzT/EXe6qZfTV6FwIm0r37Nx+OmUulV7zWM7+W9dZkAdUYxC
 wt9wyYFBUS088nzov4qm9XHA/Lf1xrn3fJBJwmjeO3m2YJxOEB3lK2i3XjZbaGl753RCPHY/b+j
 plyBZNVX99sVPMKjMKY3GvtAwF95C25h6pQV+A6dkMgCsYRzIhJUJtWMvAz915QstG9wwvM3Py5
 EA37p7iXULWUNNv29N5ogLKbBXNg==
X-Gm-Gg: ASbGncsBZB6W4Q0++xeQjrItYNzuurSWqb5bHeM8n3GA1eUn8c4TRbQknsCm05Fphq0
 TDfV56lLl4Ps1M3FddeSFtB+tJ7JsJS4P
X-Received: by 2002:a05:6000:18a7:b0:386:1ab5:f0e1 with SMTP id
 ffacd0b85a97d-3862b355428mr549538f8f.14.1733433659581; 
 Thu, 05 Dec 2024 13:20:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiv9rD97P0nB7n+IyFpR02kYuXC5B89tPtfRxH4yNU0toswWiLkYb3XpDcPSrdpA5/qH81l8PERW45wC3jpMc=
X-Received: by 2002:a05:6000:18a7:b0:386:1ab5:f0e1 with SMTP id
 ffacd0b85a97d-3862b355428mr549522f8f.14.1733433659231; Thu, 05 Dec 2024
 13:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-12-zhao1.liu@intel.com>
 <b107c5c3-9ee4-4939-a4e3-eff0cd92bad6@redhat.com>
In-Reply-To: <b107c5c3-9ee4-4939-a4e3-eff0cd92bad6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 5 Dec 2024 22:20:47 +0100
Message-ID: <CABgObfbojr4fkXq8tuuXCAGUdr3Vefddx=ERtMUx9w6Bqy0a3g@mail.gmail.com>
Subject: Re: [RFC 11/13] rust/timer/hpet: add basic HPET timer & state
To: Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PqQroKi7CxCooHiTLRJK9wRRPK26FU4lXnzSfO89Yh8_1733433660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 05 Dec 2024 21:21:04 -0000

On Thu, Dec 5, 2024 at 9:23=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
> > +    /// Instance id (HPET timer block ID).
> > +    hpet_id: BqlCell<usize>,
> > +}
> > +
> Like flags this does not need to be a cell.

Well, this *should not* need to be a cell (ideally fw_cfg would call a
C function to generate FW_CFG_HPET) but it can't be done yet, so you
can keep it. flags need not be a BqlCell though.

Paolo


