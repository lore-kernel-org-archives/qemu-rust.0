Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKhTx-00038r-Jy
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 12:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKhTw-00032L-NH
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 12:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKhTu-0005j7-5Q
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 12:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733765016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=caAng7NHpW+PkvK+ZofNHywG/NMaDtJZnzwvTdJObfo=;
 b=HB/XZQRaX7L+BVOJavhkXhssxHD9j1Y2iDGm5GBzSqrLV50uMk57S0bEkfeAXW2e9KKH8x
 EJsEsm00YgD5XIfuSn6VeHsEsazCsosaFNqsZyj+3p6ORiMBQ8dovzsa9Ap0v9J35lmW6m
 3HiynSUSPMewgIcAB71oRJi1gXh1sKY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-gf7wLKsVOMySiB0v9PA0ow-1; Mon, 09 Dec 2024 12:23:34 -0500
X-MC-Unique: gf7wLKsVOMySiB0v9PA0ow-1
X-Mimecast-MFC-AGG-ID: gf7wLKsVOMySiB0v9PA0ow
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385ded5e92aso1809994f8f.3
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 09:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733765013; x=1734369813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=caAng7NHpW+PkvK+ZofNHywG/NMaDtJZnzwvTdJObfo=;
 b=EU9aVgTuMsG82KyanZKKsvKHJDT8S4cmSgjHxPbEywBjSk+CsqJXV3ZvmY3FCcWZBN
 YE0APRUESXeR1beZgO1377pvVtfEbTek8RA6FMMpTRunbfqQldyoqwA4HUWIGNrC5iqo
 RxI0m5kzRONXLfFwcmA2anE79QW4p+pA2C71+twdl/r8FDrSJm7xnHx2Lp5PVo4SMUk/
 pvJECrXvyXq1kBRaJMSukKli/SGfPSuJaEJlLVwJJ51X9opzTqv+3P08sYNZO7qa8hoS
 2pE+rFMDoQSkggNn0uGmMYbIZSmAJBUN7H2rDRC+LTrgTBeuQdA/bbJCv8yNj2E/06el
 bHaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxKls6xJxe65sGWq0BBsuigDFF6JsFHcRkqbm+VqFV5a1Q+hitwxIjO3+J1jXqyGZw44VRiVUKyoc=@nongnu.org
X-Gm-Message-State: AOJu0Yyh5NPL5hhRliS89ZXwJLRZZGTS2FFhFmsTx+P8Pdmdp2Dk7W5h
 FCYZ+RG/4ofhySGBoiXy0Sdz8dEBexf6wK148ZkIsMsD+5eLnhmf8CcdXyrLyRL96wc/iqAHEAp
 +n8jGaymkMHxn/cVkeds518XXRLEcrnDiGZ5IO5PoaU2GOh7YpRw50NIA/SttHEImwFtoYueRDj
 LKzjpYZCNk/vmqv5p3K9QUCK4WFQ==
X-Gm-Gg: ASbGncvoPb0V6dYI2ZJpqo152RgzyR/iwNFoKcojgwajgpPpf+YjcZGWB7TWjO8wfMH
 +6dDW/G8NsVz+N3s9nOV4vcvb00yHpd4=
X-Received: by 2002:a05:6000:2b05:b0:385:fd07:85f8 with SMTP id
 ffacd0b85a97d-386453dfdc6mr846068f8f.29.1733765013635; 
 Mon, 09 Dec 2024 09:23:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv77aktlF1XvHeKZBzLPRlKA2wJFWhx/zBVdL5CyDDIYohIK/8vEVDVfPK33//ePeYjHZ2sszdlI3pfGujFkk=
X-Received: by 2002:a05:6000:2b05:b0:385:fd07:85f8 with SMTP id
 ffacd0b85a97d-386453dfdc6mr846057f8f.29.1733765013333; Mon, 09 Dec 2024
 09:23:33 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <f85a2be4-f2ad-4c00-aecf-c045b7cd2e1f@linaro.org>
In-Reply-To: <f85a2be4-f2ad-4c00-aecf-c045b7cd2e1f@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 9 Dec 2024 18:23:21 +0100
Message-ID: <CABgObfaT7cSDpuUzZ-imuhdBnsg86Qi7mt7KZ+-V-SU60+TXkg@mail.gmail.com>
Subject: Re: [PATCH 00/26] rust: bundle of prerequisites for HPET
 implementation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>, Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gDQiK0ivBYzDtbxuNUCY-sKmGMENuiiQQ66z2QxM4DI_1733765014
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 09 Dec 2024 17:23:41 -0000

On Mon, Dec 9, 2024 at 5:24=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 9/12/24 13:36, Paolo Bonzini wrote:
>
> > Paolo Bonzini (26):
> >    bql: check that the BQL is not dropped within marked sections
> >    rust: cell: add BQL-enforcing Cell variant
> >    rust: cell: add BQL-enforcing RefCell variant
> >    rust: define prelude
> >    rust: add bindings for interrupt sources
> >    rust: add a bit operation module
> >    rust: qom: add default definitions for ObjectImpl
> >    rust: qom: rename Class trait to ClassInitImpl
> >    rust: qom: convert type_info! macro to an associated const
> >    rust: qom: move ClassInitImpl to the instance side
> >    rust: qdev: move device_class_init! body to generic function,
> >      ClassInitImpl implementation to macro
> >    rust: qdev: move bridge for realize and reset functions out of pl011
> >    rust: qom: automatically use Drop trait to implement instance_finali=
ze
> >    rust: qom: move bridge for TypeInfo functions out of pl011
> >    rust: qom: split ObjectType from ObjectImpl trait
> >    rust: qom: change the parent type to an associated type
> >    rust: qom: put class_init together from multiple ClassInitImpl<>
> >    rust: qom: add possibility of overriding unparent
> >    rust: rename qemu-api modules to follow C code a bit more
> >    rust: re-export C types from qemu-api submodules
> >    rust: tests: allow writing more than one test
> >    rust: qom: add casting functionality
> >    rust: qom: add initial subset of methods on Object
> >    rust: qom: move device_id to PL011 class side
> >    rust: qemu-api: add a module to wrap functions and zero-sized closur=
es
> >    rust: callbacks: allow passing optional callbacks as ()
>
> Am I correct some patches are from Zhao Liu and got the
> authorship inadvertently removed?

Just one, which is co-authored; it has

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Co-authored-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

So I should have put either Co-authored-by him or left him as the
primary author.

Paolo


