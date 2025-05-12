Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uEV93-0003ZM-VK
	for mharc-qemu-rust@gnu.org; Mon, 12 May 2025 11:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uEV8y-0003Wm-RU
 for qemu-rust@nongnu.org; Mon, 12 May 2025 11:32:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uEV8w-0006bz-Bc
 for qemu-rust@nongnu.org; Mon, 12 May 2025 11:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747063956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TV73wcNQFlOn9H+VGZko9zPxOzSyXvcFGEr4s16QJzM=;
 b=Tsl5gtiQqTdrSoi5W9Wo8uAArBnT98OL/jh92fiM9IaUQVuVC9yqm9LpBsfko1mL+tFmdQ
 DvNFzgBF0C+EQTo2uxJO8yo3zymZGTmaw5nEkHL4+SdfdMRLjpZwp6XelQf3srFRrErkiV
 16saYRefcHDTH01M5pRXx9FRUEISU6s=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-_nopXHBDNcSkS57SRnf7wA-1; Mon, 12 May 2025 11:32:35 -0400
X-MC-Unique: _nopXHBDNcSkS57SRnf7wA-1
X-Mimecast-MFC-AGG-ID: _nopXHBDNcSkS57SRnf7wA_1747063954
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-2c6eb3e0b2aso1553756fac.0
 for <qemu-rust@nongnu.org>; Mon, 12 May 2025 08:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747063952; x=1747668752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TV73wcNQFlOn9H+VGZko9zPxOzSyXvcFGEr4s16QJzM=;
 b=IPqRdvY1w9Ym0+nQVYcaa9ONYgcwADqZ9GPXWdCId3vBEn3iAmU6wb48cIRPCTqtxw
 Te+6cpIjL+kqBHDSJxHvcldq3ydcNJkPno+gRjbcC/tgU/WGpeA8g53dXDsugStc1qB2
 05Hv85QzfUXgXY0P1xM3F0mxm1rKhXAAy8UFanacVrCNI+Zv5MFVkz7zxHQJXs7SXWE0
 flpOLIFq/9z+0TCxfQ1WfQrPY3KQQUxvJ+Exvct18YLZ8XtDeGRcsj+O8Z8HvGacfeFR
 q0Ti5oLPKddgVbU6drig08volJ0H4hzJBbRpzdeMp4sCOgsXlRfVCAEbiC+3zpN64Dr8
 AgZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK4/OXLISVyVo/FG4YlyHboZN4iMTXa6iZqTj5IV+6400FVsAODqyFJRekdzjT6uDgqzuUSGlyioE=@nongnu.org
X-Gm-Message-State: AOJu0Yz5Uiusri7Df/wcixfR4gr7dPLyK4ALm8BGiv1EaNM+R7lweXSO
 kMR0T3bCcPcNLIIBwCcq6MBnbbu/cqqIcnKdVYCEa1PBkwLm769zuX4iBCFDj/wLbS3fOKCCi+n
 jZEXBvZNjJrOHdJNJQwIm6JEoadnysk8iTXanKMLm/uf4g+f8MtM3Wsr3edJCOqhyByiGt+6JHr
 ARO5DfMOGIm5qVhWSuC3c9Y3owEBi/4aOxJPR6
X-Gm-Gg: ASbGncvoeyv5/enuOA2+q+ELMqDRIZyK8Nr6tvFYLOpw0Vlrsuotu+VybDrsqpI8OWy
 GrC5seUWLUiLG9BGMawUVotvlWdmy4Npq2I5WpS37QvrpDv7tJWuCtJsU0KxWhXngVDG5
X-Received: by 2002:a05:6870:e2cf:b0:2bc:7007:5145 with SMTP id
 586e51a60fabf-2dba42a0a61mr8388560fac.9.1747063952159; 
 Mon, 12 May 2025 08:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUne/1srv24pUyqTUsq1t4n9Ymxk5oJ+OrDmlVNSdtiO/2Ad704sGNZSZ7QOmbpmrqjw4Nj7Pqnr03eyNL5Cg=
X-Received: by 2002:a17:90b:4fd2:b0:30a:3e8e:492c with SMTP id
 98e67ed59e1d1-30c3d650661mr19906857a91.32.1747063941182; Mon, 12 May 2025
 08:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250330205857.1615-1-shentey@gmail.com>
 <20250330205857.1615-2-shentey@gmail.com>
 <340649cf-9348-458d-97e7-aee73c02217c@redhat.com>
 <540905F9-7DF7-436F-905C-A7F225F5E156@gmail.com>
 <CABC6E67-C4C7-481F-BB96-BF60957D7A84@gmail.com>
In-Reply-To: <CABC6E67-C4C7-481F-BB96-BF60957D7A84@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 May 2025 17:32:08 +0200
X-Gm-Features: AX0GCFtdPQrLMnjbXmXY9PO9w_MYLjuvu-yvzQ4zP88fiRLBQeslotB6kcCsMEU
Message-ID: <CABgObfbD-yHee4TXKqQ2gw7N8dtuB1wKqPLD5jLKXtJ8hx2xSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust/qemu-api: Add initial logging support based on C
 API
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JnwODxmU6HgNK0DLgEF3IvdWM2wyCif6cqp1odku0gU_1747063954
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 12 May 2025 15:32:44 -0000

Hi, now that GSoC selection is over I'm back. Sorry for the delay;
Tanish Desai will work mostly on tracing, so logging can remain yours.

On Tue, Apr 8, 2025 at 10:59=E2=80=AFPM Bernhard Beschow <shentey@gmail.com=
> wrote:
> >Currently the #defines contain some holes for "private" mask bits. Turni=
ng these into an
> >enum without exposing all publicly, and changing the type of qemu_loglev=
el for
> >consistency, would result in undefined behavior. Or do you suggest to co=
nvert just
> >the public #defines into an enum to expose them to Rust, and keep the re=
st of
> >the C API including the type of qemu_loglevel as is?

Yes, only in Rust.

> >There are surely several tradeoffs and/or cleanups possible here, but th=
at's way beyond for
> >what I wanted to achieve -- which is closing a gap between C and Rust. M=
y main goal is just
> >to get my feet wet with Rust.

I understand, however there is no point in defining an API and then changin=
g it.

So we need to answer the questions I wrote a few messages ago, namely:

- the mapping the LOG_* constants into Rust (e.g. whether to keep the
uppercase SNAKE_CASE or switch to something like Log::GuestError).

- whether to keep the "qemu" prefix for the API (personal opinion: no)

I agree with not having macros such as log_guest_error! for now, or
not wrapping functions like qemu_log_trylock/qemu_log_unlock that
would be implemented as RAII (i.e. returning a "guard" object) in
Rust.

> >>Also, while this is good for now, later on we probably want to reimplem=
ent logging at a lower level via the std::fmt::Write trait.  But that's jus=
t for efficiency and your macro is indeed good enough to define what the AP=
I would look like.
> >
> >Can we live with an easy solution then for now? As you suggest below, fu=
rther abstractions like log_guest_error! can be built on top which further =
insulates client code from implementation details such as the representatio=
n of the mask bits.

Yes, of course.

Paolo


