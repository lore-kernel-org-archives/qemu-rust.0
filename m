Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tIwRz-0000fT-Gh
	for mharc-qemu-rust@gnu.org; Wed, 04 Dec 2024 15:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tIwRw-0000e9-FB
 for qemu-rust@nongnu.org; Wed, 04 Dec 2024 15:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tIwRr-0006b1-MY
 for qemu-rust@nongnu.org; Wed, 04 Dec 2024 15:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733345892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=7TEZB8Lpf060C8fGk3h3HgROzL1iYLy26s2VfC6a/O4=;
 b=HLjJMys2pZCGajQa0OXfUp+/9+IB4CtTuMzjS6xU21QbCq5hYW6e1HiDpL8eBcrGIooIph
 K0N3pf1jak5e4gSXGNxNgvPJFNKGAuzjt93GTLI+Np3mW8kKO1OuCRV8pA7F7smdnl+vYu
 xmRQXlnBeYdXWW8WEWLXymsVbh0QPIM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-pOv-x5RAOMmDLwJrNml18Q-1; Wed, 04 Dec 2024 15:58:11 -0500
X-MC-Unique: pOv-x5RAOMmDLwJrNml18Q-1
X-Mimecast-MFC-AGG-ID: pOv-x5RAOMmDLwJrNml18Q
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6d366683f4aso4604436d6.3
 for <qemu-rust@nongnu.org>; Wed, 04 Dec 2024 12:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733345890; x=1733950690;
 h=to:autocrypt:subject:content-language:from:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2rp+Jo0Oy14N5MKC3kM7l3N3vw+GE0eu8C2TQ/AJrY=;
 b=i1YOuY6/PNokO1uYIX8aoKkEHIKzyHKVBj5q06ysbx4e2NTgoiZw9YUMCkL4D5++Es
 50p63ecpe9Q/mwmFYSavQWW8wu1xsbpFHtCodyLlormoOZMnZSjX9H8xtJ0x8ds6NuTz
 BZ99sPWaX9RWeKtum3U5PQzYhYTzeyo9ojoKDb3Jyao909R64ec73MVz2b2MR1AE5Oa+
 dTPZiDwwJU0h1euvgoxYrvZvLWUfaDmscgc5rpFREbXj1oxpChqOC9JBwlnwlTd6RAXE
 r7rgx7TV3nCMiP55xXrqKStMYKsdAi18SUdSj6+2UC5vYnh9Z8EfH/kw2McmWzo1Y2Ur
 oHqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5tYqhupbEDKwhgDtQx83UCByHzZqq7rDn9xes8jZr3/l8qZUwmaddQ3KHYZ+2KWVcQHy/uG4cYC4=@nongnu.org
X-Gm-Message-State: AOJu0Yz3CAIJU50eLVZqG378+JoYG7aUebynWboRPRYb+93W951SbBgY
 HJ//CDZq8EDmstBA/1swRWf7m89nXfo4dmCDLAgDiFXA/pOla4NJYBQnPvC9w2wan8WDJPzWv+/
 wa9J0OMJSzTEvxeWCabpd+V5D++Vvsd7dKZGBvAfkYhpOP+wCPR4=
X-Gm-Gg: ASbGnct99S5poWyyqk4vd4SVQ7yNOnUXSI+WMDk7uZf/qInv4RX8ie788t/1OE8SLAX
 gi6Qf/gthVtLkAQgjHbr07jWfJ+0vX7Ffzpyt0u4xKDseLrXuCE+0sXwJNdzdg+jPD5IZrX381w
 oHd/fpajF4ll/ZX9cik9byeq1Z1c9haxDfiZwMj73kVfzaR1mHW1hicCVaQ+wh5OYwJUn/2Qqb2
 6O+15gJ9h0h+7NzL/akDrsABTa5m6BCaAICcQ9RHxXVuaEYXNtK9HbvPw==
X-Received: by 2002:ad4:5f85:0:b0:6d8:a0c8:e467 with SMTP id
 6a1803df08f44-6d8b733043dmr105820726d6.13.1733345890398; 
 Wed, 04 Dec 2024 12:58:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsmTMYOQqsKCGuXv2akTLA0hrjZG1dSKDgIT/KrxSw6s2OIw2lDPjNQzY6mAH3bv5IUTYwNA==
X-Received: by 2002:ad4:5f85:0:b0:6d8:a0c8:e467 with SMTP id
 6a1803df08f44-6d8b733043dmr105820176d6.13.1733345889804; 
 Wed, 04 Dec 2024 12:58:09 -0800 (PST)
Received: from [192.168.101.123] ([50.234.104.165])
 by smtp.googlemail.com with ESMTPSA id
 6a1803df08f44-6d875163a01sm77286196d6.23.2024.12.04.12.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 12:58:08 -0800 (PST)
Message-ID: <4331e9b5-2b83-4932-8f0a-2157ed41db8a@redhat.com>
Date: Wed, 4 Dec 2024 21:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: A glimpse at PL011 emulation in safe Rust
Autocrypt: addr=pbonzini@redhat.com; keydata=
 xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
 CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
 hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
 DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
 P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
 Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
 UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
 tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
 wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0j
 UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT7CwU0EEwECACMFAlRCcBICGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRB+FRAMzTZpsbceDp9IIN6BIA0Ol7MoB15E
 11kRz/ewzryFY54tQlMnd4xxfH8MTQ/mm9I482YoSwPMdcWFAKnUX6Yo30tbLiNB8hzaHeRj
 jx12K+ptqYbg+cevgOtbLAlL9kNgLLcsGqC2829jBCUTVeMSZDrzS97ole/YEez2qFpPnTV0
 VrRWClWVfYh+JfzpXmgyhbkuwUxNFk421s4Ajp3d8nPPFUGgBG5HOxzkAm7xb1cjAuJ+oi/K
 CHfkuN+fLZl/u3E/fw7vvOESApLU5o0icVXeakfSz0LsygEnekDbxPnE5af/9FEkXJD5EoYG
 SEahaEtgNrR4qsyxyAGYgZlS70vkSSYJ+iT2rrwEiDlo31MzRo6Ba2FfHBSJ7lcYdPT7bbk9
 AO3hlNMhNdUhoQv7M5HsnqZ6unvSHOKmReNaS9egAGdRN0/GPDWr9wroyJ65ZNQsHl9nXBqE
 AukZNr5oJO5vxrYiAuuTSd6UI/xFkjtkzltG3mw5ao2bBpk/V/YuePrJsnPFHG7NhizrxttB
 nTuOSCMo45pfHQ+XYd5K1+Cv/NzZFNWscm5htJ0HznY+oOsZvHTyGz3v91pn51dkRYN0otqr
 bQ4tlFFuVjArBZcapSIe6NV8C4cEiSTOwE0EVEJx7gEIAMeHcVzuv2bp9HlWDp6+RkZe+vtl
 KwAHplb/WH59j2wyG8V6i33+6MlSSJMOFnYUCCL77bucx9uImI5nX24PIlqT+zasVEEVGSRF
 m8dgkcJDB7Tps0IkNrUi4yof3B3shR+vMY3i3Ip0e41zKx0CvlAhMOo6otaHmcxr35sWq1Jk
 tLkbn3wG+fPQCVudJJECvVQ//UAthSSEklA50QtD2sBkmQ14ZryEyTHQ+E42K3j2IUmOLriF
 dNr9NvE1QGmGyIcbw2NIVEBOK/GWxkS5+dmxM2iD4Jdaf2nSn3jlHjEXoPwpMs0KZsgdU0pP
 JQzMUMwmB1wM8JxovFlPYrhNT9MAEQEAAcLBMwQYAQIACQUCVEJx7gIbDAAKCRB+FRAMzTZp
 sadRDqCctLmYICZu4GSnie4lKXl+HqlLanpVMOoFNnWs9oRP47MbE2wv8OaYh5pNR9VVgyhD
 OG0AU7oidG36OeUlrFDTfnPYYSF/mPCxHttosyt8O5kabxnIPv2URuAxDByz+iVbL+RjKaGM
 GDph56ZTswlx75nZVtIukqzLAQ5fa8OALSGum0cFi4ptZUOhDNz1onz61klD6z3MODi0sBZN
 Aj6guB2L/+2ZwElZEeRBERRd/uommlYuToAXfNRdUwrwl9gRMiA0WSyTb190zneRRDfpSK5d
 usXnM/O+kr3Dm+Ui+UioPf6wgbn3T0o6I5BhVhs4h4hWmIW7iNhPjX1iybXfmb1gAFfjtHfL
 xRUr64svXpyfJMScIQtBAm0ihWPltXkyITA92ngCmPdHa6M1hMh4RDX+Jf1fiWubzp1voAg0
 JBrdmNZSQDz0iKmSrx8xkoXYfA3bgtFN8WJH2xgFL28XnqY4M6dLhJwV3z08tPSRqYFm4NMP
 dRsn0/7oymhneL8RthIvjDDQ5ktUjMe8LtHr70OZE/TT88qvEdhiIVUogHdo4qBrk41+gGQh
 b906Dudw5YhTJFU3nC6bbF2nrLlB4C/XSiH76ZvqzV0Z/cAMBo5NF/w=
To: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org,
 Daniel Berrange <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lEpy6UoV6qREAPJFr_Fjwj_cugkBqzBPjK0kgyb7j0o_1733345890
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------i8WbTltGQZO00KKd01N0GZIs"
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_HTML_ATTACH=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 04 Dec 2024 20:58:20 -0000

This is a multi-part message in MIME format.
--------------i8WbTltGQZO00KKd01N0GZIs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

this is finally a look at what the PL011 device model would look like
in Rust, without having to write unsafe so often.  The attached file is
a synopsis of the C code, the Rust code and my commentary (the C code is
partly rearranged to match the ordering of the Rust code).

The code compiles on my computer, but it needs some functionality that
is still untested or stubbed out.  Getting to here will take some time
and some reviews.  But in the meanwhile, this is already useful to show
what having Rust available in QEMU *actually* looks like for people who
have to write a device.

While preparing this I noticed some logic changes between the C and Rust
version, for which I will send patches in due course.  Otherwise, the
device logic was changed as little as possible and especially the naming
style.  So, while the coding style is mostly fixed to what rustfmt
produces, some adjustments to the names and how they are referred to
can be made (absolutely tell me if you prefer "registers::Data" or
"regs::Data" or "DataReg"!).

Please review and be as brutal as needed. :)  For your convenience I
copied the commentary after my signature, with line numbers; quoting it
is probably the easiest way to reply, though of course in some cases
you might prefer to quote code instead.

If we want to continue, please remember that people will need to step
in sooner rather than later (e.g. adding bindings to QAPI and DMA; but
also doing reviews to ensure that the code is not impenetrable to
anyone but me).  Or if we want to abort because there is not enough
benefit, this is also the time to decide it.

Paolo


10 These are the APIs that PL011 needs.  Note that "bindings" is not
11 imported, all that is necessary from C code has been wrapped.

14 "prelude" provides commonly used structs and traits from all over the place.

18 "qom_isa" is a macro that helps with defining QOM superclasses.

44 Rust only allows indexing arrays with usize indices.  Adding
45 the Index implementation here removes some casts elsewhere.

52 Equivalent code is generated automatically by the Rust compiler
53 (with "#[derive(Display)]" on the RegisterOffsets enum).

70 I am not very happy with the handling of bitmasks.  It is certainly
71 possible to do better.  The ".0" is because the code tries to use a
72 type wrapping the bitfields, but not hard enough (irq_level, irq_enable,
73 IRQMASK are all u32).

75 Rust supports operator overloading, but not yet in "const" context (which
76 includes "const" declarations of course, but also "static" declarations).
77 This is the main missing bit that I would like from the language.
78 Until it's in, we'll probably have to be creative.

85 Needed for migration to look at the struct.

88 These are effectively bitfields, but portable.  They are handled by an
89 external crate.  The ugly-ish part about it is that it doesn't support
90 const operation very well, so it is hard to define constants for recurring
91 values of the registers (e.g. DR_BE in the C code).

95 read_fifo could be a [registers::Data; PL011_FIFO_DEPTH] too.  Not sure
96 how that would work for vmstate, though.

98 Note how the mutable part of the device is in a separate struct.  This is
99 because all accesses check that the BQL is taken, and also that it is
100 not dropped in the middle of the access.

116 This [BqlRefCell] is what does the BQL checks.

118 Owned<> means that instance_init will add a reference to the Clock and
119 instance_finalize will drop it.

122 All superclasses have to be listed, at least for now.

124 I took a slightly different approach to the device_id, compared to the
125 C code, mostly to test whether the bindings to QOM could do subclasses
126 of classes that written themselves in Rust.

130 These "unsafe impl" are the only occurrence of unsafe in the whole device.
131 The ObjectType trait is marked unsafe because it tells the QOM C code
132 things about the layout of the PL011State struct that the user is promising.
133 Often, unsafe traits are generated by macros that can promise safety.

138 As will be visible later, implementing class_init for "standard" classes
139 is mostly automatic, but you do have to recurse up the class hierarchy.

142 This trait defines what goes in TypeInfo.

145 So for example this ends up in the TypeInfo's .instance_post_init field.

148 This "Builder" thing is a common idiom in Rust whenever not all fields
149 are always initialized.  Note that the MemoryRegionOps callbacks are
150 methods implemented by struct PL011State.

155 Rust code will have a stricter separation between instance_init and
156 instance_post_init.  The former only takes care of initializing the struct
157 (the compiler checks that all fields are initialized!), the latter does
158 other initialization such as sysbus_init_irq and sysbus_init_mmio.

172 This trait defines what goes in DeviceClass.

173 This can become a "const" with a newer version of Rust.

177 This one too.

180 Realize and reset cannot be functions in the DeviceImpl trait, because
181 the code also needs to express their *absence* (i.e. using the inherited
182 implementation).  It may be possible in the future to use procedural
183 macros to make things look a bit more natural.  But this is at the cost
184 of hidden magic, so it is a debatable benefit and for now I am leaving
185 everything visible.

189 Here I am taking a slightly different approach to callbacks;
190 they are all included in a trait instead of being methods
191 implemented by PL011State.  The reason for this is only to
192 figure out the advantages and disadvantages; this one seems
193 more "natural" but if one has more than one character device
194 backend things will get more complicated.  I am leaning
195 towards using methods for character device ops as well, which
196 is also more similar to the C API.  I started with this other
197 idea but only because I hadn't yet figured out methods

202 Due to the separation between registers and the rest, I
203 removed external interrupt update from put_fifo (and made
204 it #[must_use] to not forget).

221 The bulk of read and write is implemented on PL011Registers.  read must
222 also return whether to invoke qemu_chr_fe_accept_input() because it can
223 cause reentrancy in PL011Registers (which is an abort!).  "ControlFlow"
224 is how the code currently represents it, but it's probably easiest to
225 return a (bool, u32) pair.  Patches are welcome.

227 Here are bitfields in action.

240 Another case in which bitmasks need more work.

243 The RSR layout is the same as bits 8-15 of DR.  This is visible in
244 the types.  Including the "error clear" part in the name is probably
245 wrong because the register is only used for the reads part.  It's
246 not a "write 1 clears" registers, for example.  This brings another
247 question: what is the best way to note open improvements in the files?

297 Again some differences due to read and write being implemented on a
298 separate struct:
299
300 - read/write gets the register decoded into an enum
301
302 - write send back whether to look for interrupts
303
304 - write also needs to know the character backend.  Alternatively
305 PL011Registers could know its outer PL011State, or
306 "char_backend.write_all(&ch);" could be sent down as a
307 closure

381 This #[must_use] asks the caller to check the result (to call
382 update() or to pass it up).

428 The difference between bitfields here and ints below is a bit jarring.
429 I guess if one doesn't like it, they could use u32 like in C for both
430 registers and interrupts; nobody would complain to be honest.  Using the
431 language's features makes it clear where they leave something to be
432 desired, at least (and I don't feel like undoing the work that Manos
433 did in converting the registers to bitfields...).

463 This is still the implementation of PL011Registers.

476 And this as well.  This is *not* the reset method on DeviceState.

491 This line resets all FIFO flags, both transmit and receive.

523 Another #[must_use] here.

576 This is the callback for self.clock

582 This was the missing part of pl011_init.  BTW, vmstate is
583 the main missing part.

590 And here are also the remaining parts of read and write.
591
592 After borrow_mut(), "regs" provides a way to write to self.regs,
593 but only while the local variable regs is live.
594
595 Converting from hwaddr to enum returns Err(offset) if the offset is
596 not part of a known register.  This is one case where macros are good
597 at hiding code that "does the obvious thing".  Rust macros are more
598 powerful and generally do not have the same issues as C, but they can
599 make the code unreadable if done wrong.

602 Logging and tracing are the main missing pieces.

606 regs is dropped here.  Someone else can now write to self.regs.
607
608 Again, don't read too much in Break/Continue.  The intention of
609 the ControlFlow enum doesn't really match how QEMU uses it here.
610
611 accept_input is called after coming back; the character device
612 callbacks do their own borrow_mut().

638 PL011State needs a couple more forwarding methods to call into PL011Registers.
639 In fact, *this* is the implementation of the "reset" method in DeviceState.

667 The wrappers for qdev_prop_set_chr and sysbus_connect_irq take an
668 Owned<...> smart pointer.  This smart pointer automatically handles
669 object_ref() and object_unref().  The reason why they take Owned<...> and
670 not a normal reference is to signify that the object is heap allocated.
671 Since C gave a raw pointer, create the Owned by hand in unsafe blocks.
672 Also tell Rust not to drop it, i.e. not to call object_unref().
673
674 ... I lied, the functions take *a reference* to the pointer (that is, an
675 &Owned<...>).  This means that they *request* you to own a reference but
676 they don't steal it from you.  The functions take care of adding their own
677 reference: qemu_chr_fe_init() does it; or, if I'm not wrong, it should).
678
679 PL011State::new() gave us an Owned<PL011State>, converting it with into_raw
680 gives ownership of the reference to the C caller.

694 instance_init is mandatory in Rust; the case where you have no additional
695 fields to initialize (as is the case here) is rare enough.  This is why
696 it is an "fn" and not a "const" like REALIZE and RESET.  If needed, it
697 would be possible to write a separate wrapper for "this class only
698 differs from its superclass in its class_init method".

701 Again, the implementation is different so this is a class_init method.

715 The defaults are good. No need to override realize and reset, so the default of
716 None for the REALIZE and RESET constants are ok.

718 type_register_static is handled automagically by #[derive(Object)],
719 as an initial tasting of what macros could do.  The main things that
720 we could do with macros is implementing qdev properties in a type-safe
721 manner, and perhaps improve the bitmask situation.

--------------i8WbTltGQZO00KKd01N0GZIs
Content-Type: text/html; charset=UTF-8; name="pl011-2024-12-04.html"
Content-Disposition: attachment; filename="pl011-2024-12-04.html"
Content-Transfer-Encoding: base64

PHRhYmxlPjx0ciB2YWxpZ249InRvcCI+PHRkIGFsaWduPSJyaWdodCI+PHByZSBzdHlsZT0iY29s
b3I6Ymx1ZTsgZm9udC13ZWlnaHQ6IDcwMDsiPgoxCjIKMwo0CjUKNgo3CjgKOQoxMAoxMQoxMgox
MwoxNAoxNQoxNgoxNwoxOAoxOQoyMAoyMQoyMgoyMwoyNAoyNQoyNgoyNwoyOAoyOQozMAozMQoz
MgozMwozNAozNQozNgozNwozOAozOQo0MAo0MQo0Mgo0Mwo0NAo0NQo0Ngo0Nwo0OAo0OQo1MAo1
MQo1Mgo1Mwo1NAo1NQo1Ngo1Nwo1OAo1OQo2MAo2MQo2Mgo2Mwo2NAo2NQo2Ngo2Nwo2OAo2OQo3
MAo3MQo3Mgo3Mwo3NAo3NQo3Ngo3Nwo3OAo3OQo4MAo4MQo4Mgo4Mwo4NAo4NQo4Ngo4Nwo4OAo4
OQo5MAo5MQo5Mgo5Mwo5NAo5NQo5Ngo5Nwo5OAo5OQoxMDAKMTAxCjEwMgoxMDMKMTA0CjEwNQox
MDYKMTA3CjEwOAoxMDkKMTEwCjExMQoxMTIKMTEzCjExNAoxMTUKMTE2CjExNwoxMTgKMTE5CjEy
MAoxMjEKMTIyCjEyMwoxMjQKMTI1CjEyNgoxMjcKMTI4CjEyOQoxMzAKMTMxCjEzMgoxMzMKMTM0
CjEzNQoxMzYKMTM3CjEzOAoxMzkKMTQwCjE0MQoxNDIKMTQzCjE0NAoxNDUKMTQ2CjE0NwoxNDgK
MTQ5CjE1MAoxNTEKMTUyCjE1MwoxNTQKMTU1CjE1NgoxNTcKMTU4CjE1OQoxNjAKMTYxCjE2Mgox
NjMKMTY0CjE2NQoxNjYKMTY3CjE2OAoxNjkKMTcwCjE3MQoxNzIKMTczCjE3NAoxNzUKMTc2CjE3
NwoxNzgKMTc5CjE4MAoxODEKMTgyCjE4MwoxODQKMTg1CjE4NgoxODcKMTg4CjE4OQoxOTAKMTkx
CjE5MgoxOTMKMTk0CjE5NQoxOTYKMTk3CjE5OAoxOTkKMjAwCjIwMQoyMDIKMjAzCjIwNAoyMDUK
MjA2CjIwNwoyMDgKMjA5CjIxMAoyMTEKMjEyCjIxMwoyMTQKMjE1CjIxNgoyMTcKMjE4CjIxOQoy
MjAKMjIxCjIyMgoyMjMKMjI0CjIyNQoyMjYKMjI3CjIyOAoyMjkKMjMwCjIzMQoyMzIKMjMzCjIz
NAoyMzUKMjM2CjIzNwoyMzgKMjM5CjI0MAoyNDEKMjQyCjI0MwoyNDQKMjQ1CjI0NgoyNDcKMjQ4
CjI0OQoyNTAKMjUxCjI1MgoyNTMKMjU0CjI1NQoyNTYKMjU3CjI1OAoyNTkKMjYwCjI2MQoyNjIK
MjYzCjI2NAoyNjUKMjY2CjI2NwoyNjgKMjY5CjI3MAoyNzEKMjcyCjI3MwoyNzQKMjc1CjI3Ngoy
NzcKMjc4CjI3OQoyODAKMjgxCjI4MgoyODMKMjg0CjI4NQoyODYKMjg3CjI4OAoyODkKMjkwCjI5
MQoyOTIKMjkzCjI5NAoyOTUKMjk2CjI5NwoyOTgKMjk5CjMwMAozMDEKMzAyCjMwMwozMDQKMzA1
CjMwNgozMDcKMzA4CjMwOQozMTAKMzExCjMxMgozMTMKMzE0CjMxNQozMTYKMzE3CjMxOAozMTkK
MzIwCjMyMQozMjIKMzIzCjMyNAozMjUKMzI2CjMyNwozMjgKMzI5CjMzMAozMzEKMzMyCjMzMwoz
MzQKMzM1CjMzNgozMzcKMzM4CjMzOQozNDAKMzQxCjM0MgozNDMKMzQ0CjM0NQozNDYKMzQ3CjM0
OAozNDkKMzUwCjM1MQozNTIKMzUzCjM1NAozNTUKMzU2CjM1NwozNTgKMzU5CjM2MAozNjEKMzYy
CjM2MwozNjQKMzY1CjM2NgozNjcKMzY4CjM2OQozNzAKMzcxCjM3MgozNzMKMzc0CjM3NQozNzYK
Mzc3CjM3OAozNzkKMzgwCjM4MQozODIKMzgzCjM4NAozODUKMzg2CjM4NwozODgKMzg5CjM5MAoz
OTEKMzkyCjM5MwozOTQKMzk1CjM5NgozOTcKMzk4CjM5OQo0MDAKNDAxCjQwMgo0MDMKNDA0CjQw
NQo0MDYKNDA3CjQwOAo0MDkKNDEwCjQxMQo0MTIKNDEzCjQxNAo0MTUKNDE2CjQxNwo0MTgKNDE5
CjQyMAo0MjEKNDIyCjQyMwo0MjQKNDI1CjQyNgo0MjcKNDI4CjQyOQo0MzAKNDMxCjQzMgo0MzMK
NDM0CjQzNQo0MzYKNDM3CjQzOAo0MzkKNDQwCjQ0MQo0NDIKNDQzCjQ0NAo0NDUKNDQ2CjQ0Nwo0
NDgKNDQ5CjQ1MAo0NTEKNDUyCjQ1Mwo0NTQKNDU1CjQ1Ngo0NTcKNDU4CjQ1OQo0NjAKNDYxCjQ2
Mgo0NjMKNDY0CjQ2NQo0NjYKNDY3CjQ2OAo0NjkKNDcwCjQ3MQo0NzIKNDczCjQ3NAo0NzUKNDc2
CjQ3Nwo0NzgKNDc5CjQ4MAo0ODEKNDgyCjQ4Mwo0ODQKNDg1CjQ4Ngo0ODcKNDg4CjQ4OQo0OTAK
NDkxCjQ5Mgo0OTMKNDk0CjQ5NQo0OTYKNDk3CjQ5OAo0OTkKNTAwCjUwMQo1MDIKNTAzCjUwNAo1
MDUKNTA2CjUwNwo1MDgKNTA5CjUxMAo1MTEKNTEyCjUxMwo1MTQKNTE1CjUxNgo1MTcKNTE4CjUx
OQo1MjAKNTIxCjUyMgo1MjMKNTI0CjUyNQo1MjYKNTI3CjUyOAo1MjkKNTMwCjUzMQo1MzIKNTMz
CjUzNAo1MzUKNTM2CjUzNwo1MzgKNTM5CjU0MAo1NDEKNTQyCjU0Mwo1NDQKNTQ1CjU0Ngo1NDcK
NTQ4CjU0OQo1NTAKNTUxCjU1Mgo1NTMKNTU0CjU1NQo1NTYKNTU3CjU1OAo1NTkKNTYwCjU2MQo1
NjIKNTYzCjU2NAo1NjUKNTY2CjU2Nwo1NjgKNTY5CjU3MAo1NzEKNTcyCjU3Mwo1NzQKNTc1CjU3
Ngo1NzcKNTc4CjU3OQo1ODAKNTgxCjU4Mgo1ODMKNTg0CjU4NQo1ODYKNTg3CjU4OAo1ODkKNTkw
CjU5MQo1OTIKNTkzCjU5NAo1OTUKNTk2CjU5Nwo1OTgKNTk5CjYwMAo2MDEKNjAyCjYwMwo2MDQK
NjA1CjYwNgo2MDcKNjA4CjYwOQo2MTAKNjExCjYxMgo2MTMKNjE0CjYxNQo2MTYKNjE3CjYxOAo2
MTkKNjIwCjYyMQo2MjIKNjIzCjYyNAo2MjUKNjI2CjYyNwo2MjgKNjI5CjYzMAo2MzEKNjMyCjYz
Mwo2MzQKNjM1CjYzNgo2MzcKNjM4CjYzOQo2NDAKNjQxCjY0Mgo2NDMKNjQ0CjY0NQo2NDYKNjQ3
CjY0OAo2NDkKNjUwCjY1MQo2NTIKNjUzCjY1NAo2NTUKNjU2CjY1Nwo2NTgKNjU5CjY2MAo2NjEK
NjYyCjY2Mwo2NjQKNjY1CjY2Ngo2NjcKNjY4CjY2OQo2NzAKNjcxCjY3Mgo2NzMKNjc0CjY3NQo2
NzYKNjc3CjY3OAo2NzkKNjgwCjY4MQo2ODIKNjgzCjY4NAo2ODUKNjg2CjY4Nwo2ODgKNjg5CjY5
MAo2OTEKNjkyCjY5Mwo2OTQKNjk1CjY5Ngo2OTcKNjk4CjY5OQo3MDAKNzAxCjcwMgo3MDMKNzA0
CjcwNQo3MDYKNzA3CjcwOAo3MDkKNzEwCjcxMQo3MTIKNzEzCjcxNAo3MTUKNzE2CjcxNwo3MTgK
NzE5CjcyMAo3MjEKPC9wcmU+PC90ZD48dGQ+CjxwcmU+PGNvZGU+I2luY2x1ZGUgJnF1b3Q7cWVt
dS9vc2RlcC5oJnF1b3Q7CiNpbmNsdWRlICZxdW90O3FhcGkvZXJyb3IuaCZxdW90OwojaW5jbHVk
ZSAmcXVvdDtody9jaGFyL3BsMDExLmgmcXVvdDsKI2luY2x1ZGUgJnF1b3Q7aHcvaXJxLmgmcXVv
dDsKI2luY2x1ZGUgJnF1b3Q7aHcvc3lzYnVzLmgmcXVvdDsKI2luY2x1ZGUgJnF1b3Q7aHcvcWRl
di1jbG9jay5oJnF1b3Q7CiNpbmNsdWRlICZxdW90O2h3L3FkZXYtcHJvcGVydGllcy5oJnF1b3Q7
CiNpbmNsdWRlICZxdW90O2h3L3FkZXYtcHJvcGVydGllcy1zeXN0ZW0uaCZxdW90OwojaW5jbHVk
ZSAmcXVvdDttaWdyYXRpb24vdm1zdGF0ZS5oJnF1b3Q7CiNpbmNsdWRlICZxdW90O2NoYXJkZXYv
Y2hhci1mZS5oJnF1b3Q7CiNpbmNsdWRlICZxdW90O2NoYXJkZXYvY2hhci1zZXJpYWwuaCZxdW90
OwojaW5jbHVkZSAmcXVvdDtxZW11L2xvZy5oJnF1b3Q7CiNpbmNsdWRlICZxdW90O3FlbXUvbW9k
dWxlLmgmcXVvdDsKI2luY2x1ZGUgJnF1b3Q7dHJhY2UuaCZxdW90OwoKCjxlbT4uLi4gb21pdHRp
bmcgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgLi4uPC9lbT4KCgoKCgoKCgoKLyogSW50ZWdlciBCYXVk
IFJhdGUgRGl2aWRlciwgVUFSVElCUkQgKi8KI2RlZmluZSBJQlJEX01BU0sgMHhmZmZmCgovKiBG
cmFjdGlvbmFsIEJhdWQgUmF0ZSBEaXZpZGVyLCBVQVJURkJSRCAqLwojZGVmaW5lIEZCUkRfTUFT
SyAweDNmCgovKiBEZXB0aCBvZiBVQVJUIEZJRk8gaW4gYnl0ZXMsIHdoZW4gRklGTyBtb2RlIGlz
IGVuYWJsZWQgKGVsc2UgZGVwdGggPT0gMSkgKi8KI2RlZmluZSBQTDAxMV9GSUZPX0RFUFRIIDE2
CgpzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBwbDAxMV9pZF9hcm1bOF0gPQogIHsgMHgxMSwg
MHgxMCwgMHgxNCwgMHgwMCwgMHgwZCwgMHhmMCwgMHgwNSwgMHhiMSB9OwpzdGF0aWMgY29uc3Qg
dW5zaWduZWQgY2hhciBwbDAxMV9pZF9sdW1pbmFyeVs4XSA9CiAgeyAweDExLCAweDAwLCAweDE4
LCAweDAxLCAweDBkLCAweGYwLCAweDA1LCAweGIxIH07CgoKCgoKCgoKCgoKCnN0YXRpYyBjb25z
dCBjaGFyICpwbDAxMV9yZWduYW1lKGh3YWRkciBvZmZzZXQpCnsKICAgIHN0YXRpYyBjb25zdCBj
aGFyICpjb25zdCBybmFtZVtdID0gewogICAgICAgIFswXSA9ICZxdW90O0RSJnF1b3Q7LCBbMV0g
PSAmcXVvdDtSU1ImcXVvdDssIFs2XSA9ICZxdW90O0ZSJnF1b3Q7LCBbOF0gPSAmcXVvdDtJTFBS
JnF1b3Q7LCBbOV0gPSAmcXVvdDtJQlJEJnF1b3Q7LAogICAgICAgIFsxMF0gPSAmcXVvdDtGQlJE
JnF1b3Q7LCBbMTFdID0gJnF1b3Q7TENSSCZxdW90OywgWzEyXSA9ICZxdW90O0NSJnF1b3Q7LCBb
MTNdID0gJnF1b3Q7SUZMUyZxdW90OywgWzE0XSA9ICZxdW90O0lNU0MmcXVvdDssCiAgICAgICAg
WzE1XSA9ICZxdW90O1JJUyZxdW90OywgWzE2XSA9ICZxdW90O01JUyZxdW90OywgWzE3XSA9ICZx
dW90O0lDUiZxdW90OywgWzE4XSA9ICZxdW90O0RNQUNSJnF1b3Q7LAogICAgfTsKICAgIHVuc2ln
bmVkIGlkeCA9IG9mZnNldCAmZ3Q7Jmd0OyAyOwoKICAgIGlmIChpZHggJmx0OyBBUlJBWV9TSVpF
KHJuYW1lKSAmYW1wOyZhbXA7IHJuYW1lW2lkeF0pIHsKICAgICAgICByZXR1cm4gcm5hbWVbaWR4
XTsKICAgIH0KICAgIGlmIChpZHggJmd0Oz0gMHgzZjggJmFtcDsmYW1wOyBpZHggJmx0Oz0gMHg0
MDApIHsKICAgICAgICByZXR1cm4gJnF1b3Q7SUQmcXVvdDs7CiAgICB9CiAgICByZXR1cm4gJnF1
b3Q7VU5LTiZxdW90OzsKfQoKLyogV2hpY2ggYml0cyBpbiB0aGUgaW50ZXJydXB0IHN0YXR1cyBt
YXR0ZXIgZm9yIGVhY2ggb3V0Ym91bmQgSVJRIGxpbmUgPyAqLwpzdGF0aWMgY29uc3QgdWludDMy
X3QgaXJxbWFza1tdID0gewogICAgSU5UX0UgfCBJTlRfTVMgfCBJTlRfUlQgfCBJTlRfVFggfCBJ
TlRfUlgsIC8qIGNvbWJpbmVkIElSUSAqLwogICAgSU5UX1JYLAogICAgSU5UX1RYLAogICAgSU5U
X1JULAogICAgSU5UX01TLAogICAgSU5UX0UsCn07CgoKCgoKCk9CSkVDVF9ERUNMQVJFX1NJTVBM
RV9UWVBFKFBMMDExU3RhdGUsIFBMMDExKQoKc3RydWN0IFBMMDExU3RhdGUgewogICAgU3lzQnVz
RGV2aWNlIHBhcmVudF9vYmo7CgogICAgTWVtb3J5UmVnaW9uIGlvbWVtOwogICAgdWludDMyX3Qg
ZmxhZ3M7CiAgICB1aW50MzJfdCBsY3I7CiAgICB1aW50MzJfdCByc3I7CiAgICB1aW50MzJfdCBj
cjsKICAgIHVpbnQzMl90IGRtYWNyOwogICAgdWludDMyX3QgaW50X2VuYWJsZWQ7CiAgICB1aW50
MzJfdCBpbnRfbGV2ZWw7CiAgICB1aW50MzJfdCByZWFkX2ZpZm9bUEwwMTFfRklGT19ERVBUSF07
CiAgICB1aW50MzJfdCBpbHByOwogICAgdWludDMyX3QgaWJyZDsKICAgIHVpbnQzMl90IGZicmQ7
CiAgICB1aW50MzJfdCBpZmw7CiAgICBpbnQgcmVhZF9wb3M7CiAgICBpbnQgcmVhZF9jb3VudDsK
ICAgIGludCByZWFkX3RyaWdnZXI7CiAgICBDaGFyQmFja2VuZCBjaHI7CiAgICBxZW11X2lycSBp
cnFbNl07CiAgICBDbG9jayAqY2xrOwogICAgYm9vbCBtaWdyYXRlX2NsazsKICAgIGNvbnN0IHVu
c2lnbmVkIGNoYXIgKmlkOwp9OwoKCgoKCgoKCgoKCgoKCgoKCgpzdGF0aWMgY29uc3QgVHlwZUlu
Zm8gcGwwMTFfYXJtX2luZm8gPSB7CiAgICAubmFtZSAgICAgICAgICA9IFRZUEVfUEwwMTEsCiAg
ICAucGFyZW50ICAgICAgICA9IFRZUEVfU1lTX0JVU19ERVZJQ0UsCiAgICAuaW5zdGFuY2Vfc2l6
ZSA9IHNpemVvZihQTDAxMVN0YXRlKSwKICAgIC5pbnN0YW5jZV9pbml0ID0gcGwwMTFfaW5pdCwK
ICAgIC5jbGFzc19pbml0ICAgID0gcGwwMTFfY2xhc3NfaW5pdCwKfTsKCgoKCgoKCgoKCnN0YXRp
YyBjb25zdCBNZW1vcnlSZWdpb25PcHMgcGwwMTFfb3BzID0gewogICAgLnJlYWQgPSBwbDAxMV9y
ZWFkLAogICAgLndyaXRlID0gcGwwMTFfd3JpdGUsCiAgICAuZW5kaWFubmVzcyA9IERFVklDRV9O
QVRJVkVfRU5ESUFOLAogICAgLmltcGwubWluX2FjY2Vzc19zaXplID0gNCwKICAgIC5pbXBsLm1h
eF9hY2Nlc3Nfc2l6ZSA9IDQsCn07CgpzdGF0aWMgdm9pZCBwbDAxMV9pbml0KE9iamVjdCAqb2Jq
KQp7CiAgICBTeXNCdXNEZXZpY2UgKnNiZCA9IFNZU19CVVNfREVWSUNFKG9iaik7CiAgICBQTDAx
MVN0YXRlICpzID0gUEwwMTEob2JqKTsKICAgIGludCBpOwoKICAgIG1lbW9yeV9yZWdpb25faW5p
dF9pbygmYW1wO3MtJmd0O2lvbWVtLCBPQkpFQ1QocyksICZhbXA7cGwwMTFfb3BzLCBzLCAmcXVv
dDtwbDAxMSZxdW90OywgMHgxMDAwKTsKICAgIHN5c2J1c19pbml0X21taW8oc2JkLCAmYW1wO3Mt
Jmd0O2lvbWVtKTsKICAgIGZvciAoaSA9IDA7IGkgJmx0OyBBUlJBWV9TSVpFKHMtJmd0O2lycSk7
IGkrKykgewogICAgICAgIHN5c2J1c19pbml0X2lycShzYmQsICZhbXA7cy0mZ3Q7aXJxW2ldKTsK
ICAgIH0KCiAgICBzLSZndDtjbGsgPSBxZGV2X2luaXRfY2xvY2tfaW4oREVWSUNFKG9iaiksICZx
dW90O2NsayZxdW90OywgcGwwMTFfY2xvY2tfdXBkYXRlLCBzLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIENsb2NrVXBkYXRlKTsKICAgIHMtJmd0O2lkID0gcGwwMTFfaWRfYXJtOwp9
CgpzdGF0aWMgdm9pZCBwbDAxMV9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0
YSkKewogICAgRGV2aWNlQ2xhc3MgKmRjID0gREVWSUNFX0NMQVNTKG9jKTsKCiAgICBkYy0mZ3Q7
cmVhbGl6ZSA9IHBsMDExX3JlYWxpemU7CiAgICBkZXZpY2VfY2xhc3Nfc2V0X2xlZ2FjeV9yZXNl
dChkYywgcGwwMTFfcmVzZXQpOwogICAgZGMtJmd0O3Ztc2QgPSAmYW1wO3Ztc3RhdGVfcGwwMTE7
CiAgICBkZXZpY2VfY2xhc3Nfc2V0X3Byb3BzKGRjLCBwbDAxMV9wcm9wZXJ0aWVzKTsKfQoKCgoK
CgoKc3RhdGljIGludCBwbDAxMV9jYW5fcmVjZWl2ZSh2b2lkICpvcGFxdWUpCnsKICAgIFBMMDEx
U3RhdGUgKnMgPSAoUEwwMTFTdGF0ZSAqKW9wYXF1ZTsKICAgIGludCByOwoKICAgIHIgPSBzLSZn
dDtyZWFkX2NvdW50ICZsdDsgcGwwMTFfZ2V0X2ZpZm9fZGVwdGgocyk7CiAgICB0cmFjZV9wbDAx
MV9jYW5fcmVjZWl2ZShzLSZndDtsY3IsIHMtJmd0O3JlYWRfY291bnQsIHIpOwogICAgcmV0dXJu
IHI7Cn0KCnN0YXRpYyB2b2lkIHBsMDExX2V2ZW50KHZvaWQgKm9wYXF1ZSwgUUVNVUNockV2ZW50
IGV2ZW50KQp7CiAgICBpZiAoZXZlbnQgPT0gQ0hSX0VWRU5UX0JSRUFLICZhbXA7JmFtcDsgIXBs
MDExX2xvb3BiYWNrX2VuYWJsZWQob3BhcXVlKSkgewogICAgICAgIHBsMDExX3B1dF9maWZvKG9w
YXF1ZSwgRFJfQkUpOwogICAgfQp9CgoKCnN0YXRpYyB2b2lkIHBsMDExX3JlY2VpdmUodm9pZCAq
b3BhcXVlLCBjb25zdCB1aW50OF90ICpidWYsIGludCBzaXplKQp7CiAgICAvKgogICAgICogSW4g
bG9vcGJhY2sgbW9kZSwgdGhlIFJYIGlucHV0IHNpZ25hbCBpcyBpbnRlcm5hbGx5IGRpc2Nvbm5l
Y3RlZAogICAgICogZnJvbSB0aGUgZW50aXJlIHJlY2VpdmluZyBsb2dpY3M7IHRodXMsIGFsbCBp
bnB1dHMgYXJlIGlnbm9yZWQsCiAgICAgKiBhbmQgQlJFQUsgZGV0ZWN0aW9uIG9uIFJYIGlucHV0
IHNpZ25hbCBpcyBhbHNvIG5vdCBwZXJmb3JtZWQuCiAgICAgKi8KICAgIGlmIChwbDAxMV9sb29w
YmFja19lbmFibGVkKG9wYXF1ZSkpIHsKICAgICAgICByZXR1cm47CiAgICB9CgogICAgcGwwMTFf
cHV0X2ZpZm8ob3BhcXVlLCAqYnVmKTsKfQoKc3RhdGljIHVpbnQ2NF90IHBsMDExX3JlYWQodm9p
ZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0LAogICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBzaXplKQp7CiAgICBQTDAxMVN0YXRlICpzID0gKFBMMDExU3RhdGUgKilvcGFxdWU7CiAg
ICB1aW50MzJfdCBjOwogICAgdWludDY0X3QgcjsKCiAgICBzd2l0Y2ggKG9mZnNldCAmZ3Q7Jmd0
OyAyKSB7CiAgICBjYXNlIDA6IC8qIFVBUlREUiAqLwogICAgICAgIHMtJmd0O2ZsYWdzICZhbXA7
PSB+UEwwMTFfRkxBR19SWEZGOwogICAgICAgIGMgPSBzLSZndDtyZWFkX2ZpZm9bcy0mZ3Q7cmVh
ZF9wb3NdOwogICAgICAgIGlmIChzLSZndDtyZWFkX2NvdW50ICZndDsgMCkgewogICAgICAgICAg
ICBzLSZndDtyZWFkX2NvdW50LS07CiAgICAgICAgICAgIHMtJmd0O3JlYWRfcG9zID0gKHMtJmd0
O3JlYWRfcG9zICsgMSkgJmFtcDsgKHBsMDExX2dldF9maWZvX2RlcHRoKHMpIC0gMSk7CiAgICAg
ICAgfQogICAgICAgIGlmIChzLSZndDtyZWFkX2NvdW50ID09IDApIHsKICAgICAgICAgICAgcy0m
Z3Q7ZmxhZ3MgfD0gUEwwMTFfRkxBR19SWEZFOwogICAgICAgIH0KICAgICAgICBpZiAocy0mZ3Q7
cmVhZF9jb3VudCA9PSBzLSZndDtyZWFkX3RyaWdnZXIgLSAxKQogICAgICAgICAgICBzLSZndDtp
bnRfbGV2ZWwgJmFtcDs9IH4gSU5UX1JYOwogICAgICAgIHRyYWNlX3BsMDExX3JlYWRfZmlmbyhz
LSZndDtyZWFkX2NvdW50KTsKICAgICAgICBzLSZndDtyc3IgPSBjICZndDsmZ3Q7IDg7CiAgICAg
ICAgcGwwMTFfdXBkYXRlKHMpOwogICAgICAgIHFlbXVfY2hyX2ZlX2FjY2VwdF9pbnB1dCgmYW1w
O3MtJmd0O2Nocik7CiAgICAgICAgciA9IGM7CiAgICAgICAgYnJlYWs7CiAgICBjYXNlIDE6IC8q
IFVBUlRSU1IgKi8KICAgICAgICByID0gcy0mZ3Q7cnNyOwogICAgICAgIGJyZWFrOwogICAgY2Fz
ZSA2OiAvKiBVQVJURlIgKi8KICAgICAgICByID0gcy0mZ3Q7ZmxhZ3M7CiAgICAgICAgYnJlYWs7
CiAgICBjYXNlIDg6IC8qIFVBUlRJTFBSICovCiAgICAgICAgciA9IHMtJmd0O2lscHI7CiAgICAg
ICAgYnJlYWs7CiAgICBjYXNlIDk6IC8qIFVBUlRJQlJEICovCiAgICAgICAgciA9IHMtJmd0O2li
cmQ7CiAgICAgICAgYnJlYWs7CiAgICBjYXNlIDEwOiAvKiBVQVJURkJSRCAqLwogICAgICAgIHIg
PSBzLSZndDtmYnJkOwogICAgICAgIGJyZWFrOwogICAgY2FzZSAxMTogLyogVUFSVExDUl9IICov
CiAgICAgICAgciA9IHMtJmd0O2xjcjsKICAgICAgICBicmVhazsKICAgIGNhc2UgMTI6IC8qIFVB
UlRDUiAqLwogICAgICAgIHIgPSBzLSZndDtjcjsKICAgICAgICBicmVhazsKICAgIGNhc2UgMTM6
IC8qIFVBUlRJRkxTICovCiAgICAgICAgciA9IHMtJmd0O2lmbDsKICAgICAgICBicmVhazsKICAg
IGNhc2UgMTQ6IC8qIFVBUlRJTVNDICovCiAgICAgICAgciA9IHMtJmd0O2ludF9lbmFibGVkOwog
ICAgICAgIGJyZWFrOwogICAgY2FzZSAxNTogLyogVUFSVFJJUyAqLwogICAgICAgIHIgPSBzLSZn
dDtpbnRfbGV2ZWw7CiAgICAgICAgYnJlYWs7CiAgICBjYXNlIDE2OiAvKiBVQVJUTUlTICovCiAg
ICAgICAgciA9IHMtJmd0O2ludF9sZXZlbCAmYW1wOyBzLSZndDtpbnRfZW5hYmxlZDsKICAgICAg
ICBicmVhazsKICAgIGNhc2UgMTg6IC8qIFVBUlRETUFDUiAqLwogICAgICAgIHIgPSBzLSZndDtk
bWFjcjsKICAgICAgICBicmVhazsKICAgIGNhc2UgMHgzZjggLi4uIDB4NDAwOgogICAgICAgIHIg
PSBzLSZndDtpZFsob2Zmc2V0IC0gMHhmZTApICZndDsmZ3Q7IDJdOwogICAgICAgIGJyZWFrOwog
ICAgZGVmYXVsdDoKICAgICAgICBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwKICAgICAg
ICAgICAgICAgICAgICAgICZxdW90O3BsMDExX3JlYWQ6IEJhZCBvZmZzZXQgMHgleFxuJnF1b3Q7
LCAoaW50KW9mZnNldCk7CiAgICAgICAgciA9IDA7CiAgICAgICAgYnJlYWs7CiAgICB9CgogICAg
dHJhY2VfcGwwMTFfcmVhZChvZmZzZXQsIHIsIHBsMDExX3JlZ25hbWUob2Zmc2V0KSk7CiAgICBy
ZXR1cm4gcjsKfQoKc3RhdGljIHZvaWQgcGwwMTFfd3JpdGUodm9pZCAqb3BhcXVlLCBod2FkZHIg
b2Zmc2V0LAogICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCB2YWx1ZSwgdW5zaWduZWQg
c2l6ZSkKewogICAgUEwwMTFTdGF0ZSAqcyA9IChQTDAxMVN0YXRlICopb3BhcXVlOwogICAgdW5z
aWduZWQgY2hhciBjaDsKCiAgICB0cmFjZV9wbDAxMV93cml0ZShvZmZzZXQsIHZhbHVlLCBwbDAx
MV9yZWduYW1lKG9mZnNldCkpOwoKICAgIHN3aXRjaCAob2Zmc2V0ICZndDsmZ3Q7IDIpIHsKICAg
IGNhc2UgMDogLyogVUFSVERSICovCiAgICAgICAgLyogPz8/IENoZWNrIGlmIHRyYW5zbWl0dGVy
IGlzIGVuYWJsZWQuICAqLwogICAgICAgIGNoID0gdmFsdWU7CiAgICAgICAgLyogWFhYIHRoaXMg
YmxvY2tzIGVudGlyZSB0aHJlYWQuIFJld3JpdGUgdG8gdXNlCiAgICAgICAgICogcWVtdV9jaHJf
ZmVfd3JpdGUgYW5kIGJhY2tncm91bmQgSS9PIGNhbGxiYWNrcyAqLwogICAgICAgIHFlbXVfY2hy
X2ZlX3dyaXRlX2FsbCgmYW1wO3MtJmd0O2NociwgJmFtcDtjaCwgMSk7CiAgICAgICAgcGwwMTFf
bG9vcGJhY2tfdHgocywgY2gpOwogICAgICAgIHMtJmd0O2ludF9sZXZlbCB8PSBJTlRfVFg7CiAg
ICAgICAgcGwwMTFfdXBkYXRlKHMpOwogICAgICAgIGJyZWFrOwogICAgY2FzZSAxOiAvKiBVQVJU
UlNSL1VBUlRFQ1IgKi8KICAgICAgICBzLSZndDtyc3IgPSAwOwogICAgICAgIGJyZWFrOwogICAg
Y2FzZSA2OiAvKiBVQVJURlIgKi8KICAgICAgICAvKiBXcml0ZXMgdG8gRmxhZyByZWdpc3RlciBh
cmUgaWdub3JlZC4gICovCiAgICAgICAgYnJlYWs7CiAgICBjYXNlIDg6IC8qIFVBUlRJTFBSICov
CiAgICAgICAgcy0mZ3Q7aWxwciA9IHZhbHVlOwogICAgICAgIGJyZWFrOwogICAgY2FzZSA5OiAv
KiBVQVJUSUJSRCAqLwogICAgICAgIHMtJmd0O2licmQgPSB2YWx1ZSAmYW1wOyBJQlJEX01BU0s7
CiAgICAgICAgcGwwMTFfdHJhY2VfYmF1ZHJhdGVfY2hhbmdlKHMpOwogICAgICAgIGJyZWFrOwog
ICAgY2FzZSAxMDogLyogVUFSVEZCUkQgKi8KICAgICAgICBzLSZndDtmYnJkID0gdmFsdWUgJmFt
cDsgRkJSRF9NQVNLOwogICAgICAgIHBsMDExX3RyYWNlX2JhdWRyYXRlX2NoYW5nZShzKTsKICAg
ICAgICBicmVhazsKICAgIGNhc2UgMTE6IC8qIFVBUlRMQ1JfSCAqLwogICAgICAgIC8qIFJlc2V0
IHRoZSBGSUZPIHN0YXRlIG9uIEZJRk8gZW5hYmxlIG9yIGRpc2FibGUgKi8KICAgICAgICBpZiAo
KHMtJmd0O2xjciBeIHZhbHVlKSAmYW1wOyBMQ1JfRkVOKSB7CiAgICAgICAgICAgIHBsMDExX3Jl
c2V0X2ZpZm8ocyk7CiAgICAgICAgfQogICAgICAgIGlmICgocy0mZ3Q7bGNyIF4gdmFsdWUpICZh
bXA7IExDUl9CUkspIHsKICAgICAgICAgICAgaW50IGJyZWFrX2VuYWJsZSA9IHZhbHVlICZhbXA7
IExDUl9CUks7CiAgICAgICAgICAgIHFlbXVfY2hyX2ZlX2lvY3RsKCZhbXA7cy0mZ3Q7Y2hyLCBD
SFJfSU9DVExfU0VSSUFMX1NFVF9CUkVBSywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JmFtcDticmVha19lbmFibGUpOwogICAgICAgICAgICBwbDAxMV9sb29wYmFja19icmVhayhzLCBi
cmVha19lbmFibGUpOwogICAgICAgIH0KICAgICAgICBzLSZndDtsY3IgPSB2YWx1ZTsKICAgICAg
ICBwbDAxMV9zZXRfcmVhZF90cmlnZ2VyKHMpOwogICAgICAgIGJyZWFrOwogICAgY2FzZSAxMjog
LyogVUFSVENSICovCiAgICAgICAgLyogPz8/IE5lZWQgdG8gaW1wbGVtZW50IHRoZSBlbmFibGUg
Yml0LiAgKi8KICAgICAgICBzLSZndDtjciA9IHZhbHVlOwogICAgICAgIHBsMDExX2xvb3BiYWNr
X21kbWN0cmwocyk7CiAgICAgICAgYnJlYWs7CiAgICBjYXNlIDEzOiAvKiBVQVJUSUZTICovCiAg
ICAgICAgcy0mZ3Q7aWZsID0gdmFsdWU7CiAgICAgICAgcGwwMTFfc2V0X3JlYWRfdHJpZ2dlcihz
KTsKICAgICAgICBicmVhazsKICAgIGNhc2UgMTQ6IC8qIFVBUlRJTVNDICovCiAgICAgICAgcy0m
Z3Q7aW50X2VuYWJsZWQgPSB2YWx1ZTsKICAgICAgICBwbDAxMV91cGRhdGUocyk7CiAgICAgICAg
YnJlYWs7CiAgICBjYXNlIDE3OiAvKiBVQVJUSUNSICovCiAgICAgICAgcy0mZ3Q7aW50X2xldmVs
ICZhbXA7PSB+dmFsdWU7CiAgICAgICAgcGwwMTFfdXBkYXRlKHMpOwogICAgICAgIGJyZWFrOwog
ICAgY2FzZSAxODogLyogVUFSVERNQUNSICovCiAgICAgICAgcy0mZ3Q7ZG1hY3IgPSB2YWx1ZTsK
ICAgICAgICBpZiAodmFsdWUgJmFtcDsgMykgewogICAgICAgICAgICBxZW11X2xvZ19tYXNrKExP
R19VTklNUCwgJnF1b3Q7cGwwMTE6IERNQSBub3QgaW1wbGVtZW50ZWRcbiZxdW90Oyk7CiAgICAg
ICAgfQogICAgICAgIGJyZWFrOwogICAgZGVmYXVsdDoKICAgICAgICBxZW11X2xvZ19tYXNrKExP
R19HVUVTVF9FUlJPUiwKICAgICAgICAgICAgICAgICAgICAgICZxdW90O3BsMDExX3dyaXRlOiBC
YWQgb2Zmc2V0IDB4JXhcbiZxdW90OywgKGludClvZmZzZXQpOwogICAgfQp9CgoKCgoKCnN0YXRp
YyB2b2lkIHBsMDExX2xvb3BiYWNrX3R4KFBMMDExU3RhdGUgKnMsIHVpbnQzMl90IHZhbHVlKQp7
CiAgICBpZiAoIXBsMDExX2xvb3BiYWNrX2VuYWJsZWQocykpIHsKICAgICAgICByZXR1cm47CiAg
ICB9CgogICAgLyoKICAgICAqIENhdmVhdDoKICAgICAqCiAgICAgKiBJbiByZWFsIGhhcmR3YXJl
LCBUWCBsb29wYmFjayBoYXBwZW5zIGF0IHRoZSBzZXJpYWwtYml0IGxldmVsCiAgICAgKiBhbmQg
dGhlbiByZWFzc2VtYmxlZCBieSB0aGUgUlggbG9naWNzIGJhY2sgaW50byBieXRlcyBhbmQgcGxh
Y2VkCiAgICAgKiBpbnRvIHRoZSBSWCBmaWZvLiBUaGF0IGlzLCBsb29wYmFjayBoYXBwZW5zIGFm
dGVyIFRYIGZpZm8uCiAgICAgKgogICAgICogQmVjYXVzZSB0aGUgcmVhbCBoYXJkd2FyZSBUWCBm
aWZvIGlzIHRpbWUtZHJhaW5lZCBhdCB0aGUgZnJhbWUKICAgICAqIHJhdGUgZ292ZXJuZWQgYnkg
dGhlIGNvbmZpZ3VyZWQgc2VyaWFsIGZvcm1hdCwgc29tZSBsb29wYmFjawogICAgICogYnl0ZXMg
aW4gVFggZmlmbyBtYXkgc3RpbGwgYmUgYWJsZSB0byBnZXQgaW50byB0aGUgUlggZmlmbwogICAg
ICogdGhhdCBjb3VsZCBiZSBmdWxsIGF0IHRpbWVzIHdoaWxlIGJlaW5nIGRyYWluZWQgYXQgc29m
dHdhcmUKICAgICAqIHBhY2UuCiAgICAgKgogICAgICogSW4gc3VjaCBzY2VuYXJpbywgdGhlIFJY
IGRyYWluaW5nIHBhY2UgaXMgdGhlIG1ham9yIGZhY3RvcgogICAgICogZGVjaWRpbmcgd2hpY2gg
bG9vcGJhY2sgYnl0ZXMgZ2V0IGludG8gdGhlIFJYIGZpZm8sIHVubGVzcwogICAgICogaGFyZHdh
cmUgZmxvdy1jb250cm9sIGlzIGVuYWJsZWQuCiAgICAgKgogICAgICogRm9yIHNpbXBsaWNpdHks
IHRoZSBhYm92ZSBkZXNjcmliZWQgaXMgbm90IGVtdWxhdGVkLgogICAgICovCiAgICBwbDAxMV9w
dXRfZmlmbyhzLCB2YWx1ZSk7Cn0KCnN0YXRpYyB2b2lkIHBsMDExX2xvb3BiYWNrX21kbWN0cmwo
UEwwMTFTdGF0ZSAqcykKewogICAgdWludDMyX3QgY3IsIGZyLCBpbDsKCiAgICBpZiAoIXBsMDEx
X2xvb3BiYWNrX2VuYWJsZWQocykpIHsKICAgICAgICByZXR1cm47CiAgICB9CgogICAgLyoKICAg
ICAqIExvb3BiYWNrIHNvZnR3YXJlLWRyaXZlbiBtb2RlbSBjb250cm9sIG91dHB1dHMgdG8gbW9k
ZW0gc3RhdHVzIGlucHV0czoKICAgICAqICAgRlIuUkkgICZsdDs9IENSLk91dDIKICAgICAqICAg
RlIuRENEICZsdDs9IENSLk91dDEKICAgICAqICAgRlIuQ1RTICZsdDs9IENSLlJUUwogICAgICog
ICBGUi5EU1IgJmx0Oz0gQ1IuRFRSCiAgICAgKgogICAgICogVGhlIGxvb3BiYWNrIGhhcHBlbnMg
aW1tZWRpYXRlbHkgZXZlbiBpZiB0aGlzIGNhbGwgaXMgdHJpZ2dlcmVkCiAgICAgKiBieSBzZXR0
aW5nIG9ubHkgQ1IuTEJFLgogICAgICoKICAgICAqIENUUy9SVFMgdXBkYXRlcyBkdWUgdG8gZW5h
YmxlZCBoYXJkd2FyZSBmbG93IGNvbnRyb2xzIGFyZSBub3QKICAgICAqIGRlYWx0IHdpdGggaGVy
ZS4KICAgICAqLwogICAgY3IgPSBzLSZndDtjcjsKICAgIGZyID0gcy0mZ3Q7ZmxhZ3MgJmFtcDsg
fihQTDAxMV9GTEFHX1JJIHwgUEwwMTFfRkxBR19EQ0QgfAogICAgICAgICAgICAgICAgICAgICAg
UEwwMTFfRkxBR19EU1IgfCBQTDAxMV9GTEFHX0NUUyk7CiAgICBmciB8PSAoY3IgJmFtcDsgQ1Jf
T1VUMikgPyBQTDAxMV9GTEFHX1JJICA6IDA7CiAgICBmciB8PSAoY3IgJmFtcDsgQ1JfT1VUMSkg
PyBQTDAxMV9GTEFHX0RDRCA6IDA7CiAgICBmciB8PSAoY3IgJmFtcDsgQ1JfUlRTKSAgPyBQTDAx
MV9GTEFHX0NUUyA6IDA7CiAgICBmciB8PSAoY3IgJmFtcDsgQ1JfRFRSKSAgPyBQTDAxMV9GTEFH
X0RTUiA6IDA7CgogICAgLyogQ2hhbmdlIGludGVycnVwdHMgYmFzZWQgb24gdXBkYXRlZCBGUiAq
LwogICAgaWwgPSBzLSZndDtpbnRfbGV2ZWwgJmFtcDsgfihJTlRfRFNSIHwgSU5UX0RDRCB8IElO
VF9DVFMgfCBJTlRfUkkpOwogICAgaWwgfD0gKGZyICZhbXA7IFBMMDExX0ZMQUdfRFNSKSA/IElO
VF9EU1IgOiAwOwogICAgaWwgfD0gKGZyICZhbXA7IFBMMDExX0ZMQUdfRENEKSA/IElOVF9EQ0Qg
OiAwOwogICAgaWwgfD0gKGZyICZhbXA7IFBMMDExX0ZMQUdfQ1RTKSA/IElOVF9DVFMgOiAwOwog
ICAgaWwgfD0gKGZyICZhbXA7IFBMMDExX0ZMQUdfUkkpICA/IElOVF9SSSAgOiAwOwoKICAgIHMt
Jmd0O2ZsYWdzID0gZnI7CiAgICBzLSZndDtpbnRfbGV2ZWwgPSBpbDsKICAgIHBsMDExX3VwZGF0
ZShzKTsKfQoKCgoKCgpzdGF0aWMgdm9pZCBwbDAxMV9sb29wYmFja19icmVhayhQTDAxMVN0YXRl
ICpzLCBpbnQgYnJrX2VuYWJsZSkKewogICAgaWYgKGJya19lbmFibGUpIHsKICAgICAgICBwbDAx
MV9sb29wYmFja190eChzLCBEUl9CRSk7CiAgICB9Cn0KCnN0YXRpYyB2b2lkIHBsMDExX3NldF9y
ZWFkX3RyaWdnZXIoUEwwMTFTdGF0ZSAqcykKewojaWYgMAogICAgLyogVGhlIGRvY3Mgc2F5IHRo
ZSBSWCBpbnRlcnJ1cHQgaXMgdHJpZ2dlcmVkIHdoZW4gdGhlIEZJRk8gZXhjZWVkcwogICAgICAg
dGhlIHRocmVzaG9sZC4gIEhvd2V2ZXIgbGludXggb25seSByZWFkcyB0aGUgRklGTyBpbiByZXNw
b25zZSB0byBhbgogICAgICAgaW50ZXJydXB0LiAgVHJpZ2dlcmluZyB0aGUgaW50ZXJydXB0IHdo
ZW4gdGhlIEZJRk8gaXMgbm9uLWVtcHR5IHNlZW1zCiAgICAgICB0byBtYWtlIHRoaW5ncyB3b3Jr
LiAgKi8KICAgIGlmIChzLSZndDtsY3IgJmFtcDsgTENSX0ZFTikKICAgICAgICBzLSZndDtyZWFk
X3RyaWdnZXIgPSAocy0mZ3Q7aWZsICZndDsmZ3Q7IDEpICZhbXA7IDB4MWM7CiAgICBlbHNlCiNl
bmRpZgogICAgICAgIHMtJmd0O3JlYWRfdHJpZ2dlciA9IDE7Cn0KCnN0YXRpYyB2b2lkIHBsMDEx
X3Jlc2V0KERldmljZVN0YXRlICpkZXYpCnsKICAgIFBMMDExU3RhdGUgKnMgPSBQTDAxMShkZXYp
OwoKICAgIHMtJmd0O2xjciA9IDA7CiAgICBzLSZndDtyc3IgPSAwOwogICAgcy0mZ3Q7ZG1hY3Ig
PSAwOwogICAgcy0mZ3Q7aW50X2VuYWJsZWQgPSAwOwogICAgcy0mZ3Q7aW50X2xldmVsID0gMDsK
ICAgIHMtJmd0O2lscHIgPSAwOwogICAgcy0mZ3Q7aWJyZCA9IDA7CiAgICBzLSZndDtmYnJkID0g
MDsKICAgIHMtJmd0O3JlYWRfdHJpZ2dlciA9IDE7CiAgICBzLSZndDtpZmwgPSAweDEyOwogICAg
cy0mZ3Q7Y3IgPSAweDMwMDsKICAgIHMtJmd0O2ZsYWdzID0gMDsKICAgIHBsMDExX3Jlc2V0X2Zp
Zm8ocyk7Cn0KCnN0YXRpYyBpbmxpbmUgdm9pZCBwbDAxMV9yZXNldF9maWZvKFBMMDExU3RhdGUg
KnMpCnsKICAgIHMtJmd0O3JlYWRfY291bnQgPSAwOwogICAgcy0mZ3Q7cmVhZF9wb3MgPSAwOwoK
ICAgIC8qIFJlc2V0IEZJRk8gZmxhZ3MgKi8KICAgIHMtJmd0O2ZsYWdzICZhbXA7PSB+KFBMMDEx
X0ZMQUdfUlhGRiB8IFBMMDExX0ZMQUdfVFhGRik7CiAgICBzLSZndDtmbGFncyB8PSBQTDAxMV9G
TEFHX1JYRkUgfCBQTDAxMV9GTEFHX1RYRkU7Cn0KCnN0YXRpYyBib29sIHBsMDExX2lzX2ZpZm9f
ZW5hYmxlZChQTDAxMVN0YXRlICpzKQp7CiAgICByZXR1cm4gKHMtJmd0O2xjciAmYW1wOyBMQ1Jf
RkVOKSAhPSAwOwp9CgpzdGF0aWMgYm9vbCBwbDAxMV9sb29wYmFja19lbmFibGVkKFBMMDExU3Rh
dGUgKnMpCnsKICAgIHJldHVybiAhIShzLSZndDtjciAmYW1wOyBDUl9MQkUpOwp9CgpzdGF0aWMg
aW5saW5lIHVuc2lnbmVkIHBsMDExX2dldF9maWZvX2RlcHRoKFBMMDExU3RhdGUgKnMpCnsKICAg
IC8qIE5vdGU6IEZJRk8gZGVwdGggaXMgZXhwZWN0ZWQgdG8gYmUgcG93ZXItb2YtMiAqLwogICAg
cmV0dXJuIHBsMDExX2lzX2ZpZm9fZW5hYmxlZChzKSA/IFBMMDExX0ZJRk9fREVQVEggOiAxOwp9
CgoKCgpzdGF0aWMgdm9pZCBwbDAxMV9wdXRfZmlmbyh2b2lkICpvcGFxdWUsIHVpbnQzMl90IHZh
bHVlKQp7CiAgICBQTDAxMVN0YXRlICpzID0gKFBMMDExU3RhdGUgKilvcGFxdWU7CiAgICBpbnQg
c2xvdDsKICAgIHVuc2lnbmVkIHBpcGVfZGVwdGg7CgogICAgcGlwZV9kZXB0aCA9IHBsMDExX2dl
dF9maWZvX2RlcHRoKHMpOwogICAgc2xvdCA9IChzLSZndDtyZWFkX3BvcyArIHMtJmd0O3JlYWRf
Y291bnQpICZhbXA7IChwaXBlX2RlcHRoIC0gMSk7CiAgICBzLSZndDtyZWFkX2ZpZm9bc2xvdF0g
PSB2YWx1ZTsKICAgIHMtJmd0O3JlYWRfY291bnQrKzsKICAgIHMtJmd0O2ZsYWdzICZhbXA7PSB+
UEwwMTFfRkxBR19SWEZFOwogICAgdHJhY2VfcGwwMTFfcHV0X2ZpZm8odmFsdWUsIHMtJmd0O3Jl
YWRfY291bnQpOwogICAgaWYgKHMtJmd0O3JlYWRfY291bnQgPT0gcGlwZV9kZXB0aCkgewogICAg
ICAgIHRyYWNlX3BsMDExX3B1dF9maWZvX2Z1bGwoKTsKICAgICAgICBzLSZndDtmbGFncyB8PSBQ
TDAxMV9GTEFHX1JYRkY7CiAgICB9CiAgICBpZiAocy0mZ3Q7cmVhZF9jb3VudCA9PSBzLSZndDty
ZWFkX3RyaWdnZXIpIHsKICAgICAgICBzLSZndDtpbnRfbGV2ZWwgfD0gSU5UX1JYOwogICAgICAg
IHBsMDExX3VwZGF0ZShzKTsKICAgIH0KfQoKc3RhdGljIGludCBwbDAxMV9wb3N0X2xvYWQodm9p
ZCAqb3BhcXVlLCBpbnQgdmVyc2lvbl9pZCkKewogICAgUEwwMTFTdGF0ZSogcyA9IG9wYXF1ZTsK
CiAgICAvKiBTYW5pdHktY2hlY2sgaW5wdXQgc3RhdGUgKi8KICAgIGlmIChzLSZndDtyZWFkX3Bv
cyAmZ3Q7PSBBUlJBWV9TSVpFKHMtJmd0O3JlYWRfZmlmbykgfHwKICAgICAgICBzLSZndDtyZWFk
X2NvdW50ICZndDsgQVJSQVlfU0laRShzLSZndDtyZWFkX2ZpZm8pKSB7CiAgICAgICAgcmV0dXJu
IC0xOwogICAgfQoKICAgIGlmICghcGwwMTFfaXNfZmlmb19lbmFibGVkKHMpICZhbXA7JmFtcDsg
cy0mZ3Q7cmVhZF9jb3VudCAmZ3Q7IDAgJmFtcDsmYW1wOyBzLSZndDtyZWFkX3BvcyAmZ3Q7IDAp
IHsKICAgICAgICAvKgogICAgICAgICAqIE9sZGVyIHZlcnNpb25zIG9mIFBMMDExIGRpZG4mIzM5
O3QgZW5zdXJlIHRoYXQgdGhlIHNpbmdsZQogICAgICAgICAqIGNoYXJhY3RlciBpbiB0aGUgRklG
TyBpbiBGSUZPLWRpc2FibGVkIG1vZGUgaXMgaW4KICAgICAgICAgKiBlbGVtZW50IDAgb2YgdGhl
IGFycmF5OyBjb252ZXJ0IHRvIGZvbGxvdyB0aGUgY3VycmVudAogICAgICAgICAqIGNvZGUmIzM5
O3MgYXNzdW1wdGlvbnMuCiAgICAgICAgICovCiAgICAgICAgcy0mZ3Q7cmVhZF9maWZvWzBdID0g
cy0mZ3Q7cmVhZF9maWZvW3MtJmd0O3JlYWRfcG9zXTsKICAgICAgICBzLSZndDtyZWFkX3BvcyA9
IDA7CiAgICB9CgogICAgcy0mZ3Q7aWJyZCAmYW1wOz0gSUJSRF9NQVNLOwogICAgcy0mZ3Q7ZmJy
ZCAmYW1wOz0gRkJSRF9NQVNLOwoKICAgIHJldHVybiAwOwp9Cgo8ZW0+IC4uLiBvbWl0dGluZyB0
cmFjZXBvaW50IHN1cHBvcnQgLi4uIDwvZW0+CgpzdGF0aWMgdm9pZCBwbDAxMV9jbG9ja191cGRh
dGUodm9pZCAqb3BhcXVlLCBDbG9ja0V2ZW50IGV2ZW50KQp7CiAgICBQTDAxMVN0YXRlICpzID0g
UEwwMTEob3BhcXVlKTsKCiAgICBwbDAxMV90cmFjZV9iYXVkcmF0ZV9jaGFuZ2Uocyk7Cn0KCjxl
bT4gLi4uIG9taXR0aW5nIHZtc3RhdGUgZGVmaW5pdGlvbnMgKFJ1c3QgQVBJIG5vdCBmaW5hbCkg
Li4uIDwvZW0+CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoK
c3RhdGljIHZvaWQgcGwwMTFfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnAp
CnsKICAgIFBMMDExU3RhdGUgKnMgPSBQTDAxMShkZXYpOwoKICAgIHFlbXVfY2hyX2ZlX3NldF9o
YW5kbGVycygmYW1wO3MtJmd0O2NociwgcGwwMTFfY2FuX3JlY2VpdmUsIHBsMDExX3JlY2VpdmUs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGwwMTFfZXZlbnQsIE5VTEwsIHMsIE5VTEws
IHRydWUpOwp9CgoKCgoKCgoKCgoKc3RhdGljIHZvaWQgcGwwMTFfdXBkYXRlKFBMMDExU3RhdGUg
KnMpCnsKICAgIHVpbnQzMl90IGZsYWdzOwogICAgaW50IGk7CgogICAgZmxhZ3MgPSBzLSZndDtp
bnRfbGV2ZWwgJmFtcDsgcy0mZ3Q7aW50X2VuYWJsZWQ7CiAgICB0cmFjZV9wbDAxMV9pcnFfc3Rh
dGUoZmxhZ3MgIT0gMCk7CiAgICBmb3IgKGkgPSAwOyBpICZsdDsgQVJSQVlfU0laRShzLSZndDtp
cnEpOyBpKyspIHsKICAgICAgICBxZW11X3NldF9pcnEocy0mZ3Q7aXJxW2ldLCAoZmxhZ3MgJmFt
cDsgaXJxbWFza1tpXSkgIT0gMCk7CiAgICB9Cn0KCgoKCkRldmljZVN0YXRlICpwbDAxMV9jcmVh
dGUoaHdhZGRyIGFkZHIsIHFlbXVfaXJxIGlycSwgQ2hhcmRldiAqY2hyKQp7CiAgICBEZXZpY2VT
dGF0ZSAqZGV2OwogICAgU3lzQnVzRGV2aWNlICpzOwoKCgoKCgogICAgZGV2ID0gcWRldl9uZXco
JnF1b3Q7cGwwMTEmcXVvdDspOwogICAgcyA9IFNZU19CVVNfREVWSUNFKGRldik7CiAgICBxZGV2
X3Byb3Bfc2V0X2NocihkZXYsICZxdW90O2NoYXJkZXYmcXVvdDssIGNocik7CiAgICBzeXNidXNf
cmVhbGl6ZV9hbmRfdW5yZWYocywgJmFtcDtlcnJvcl9mYXRhbCk7CiAgICBzeXNidXNfbW1pb19t
YXAocywgMCwgYWRkcik7CiAgICBzeXNidXNfY29ubmVjdF9pcnEocywgMCwgaXJxKTsKCiAgICBy
ZXR1cm4gZGV2Owp9CgoKCgoKCgoKCgoKCgoKCgoKCgpzdGF0aWMgdm9pZCBwbDAxMV9sdW1pbmFy
eV9pbml0KE9iamVjdCAqb2JqKQp7CiAgICBQTDAxMVN0YXRlICpzID0gUEwwMTEob2JqKTsKCiAg
ICBzLSZndDtpZCA9IHBsMDExX2lkX2x1bWluYXJ5Owp9CgpzdGF0aWMgY29uc3QgVHlwZUluZm8g
cGwwMTFfbHVtaW5hcnlfaW5mbyA9IHsKICAgIC5uYW1lICAgICAgICAgID0gVFlQRV9QTDAxMV9M
VU1JTkFSWSwKICAgIC5wYXJlbnQgICAgICAgID0gVFlQRV9QTDAxMSwKICAgIC5pbnN0YW5jZV9p
bml0ID0gcGwwMTFfbHVtaW5hcnlfaW5pdCwKfTsKCgoKCgpzdGF0aWMgdm9pZCBwbDAxMV9yZWdp
c3Rlcl90eXBlcyh2b2lkKQp7CiAgICB0eXBlX3JlZ2lzdGVyX3N0YXRpYygmYW1wO3BsMDExX2Fy
bV9pbmZvKTsKICAgIHR5cGVfcmVnaXN0ZXJfc3RhdGljKCZhbXA7cGwwMTFfbHVtaW5hcnlfaW5m
byk7Cn0KCnR5cGVfaW5pdChwbDAxMV9yZWdpc3Rlcl90eXBlcyk8L2NvZGU+PC9wcmU+CjwvdGQ+
PHRkPgo8cHJlPjxjb2RlPnVzZSBzdGQ6OnsKICAgIGZmaTo6Q1N0ciwKICAgIG1lbTo6TWFudWFs
bHlEcm9wLAogICAgb3BzOjpDb250cm9sRmxvdywKfTsKCnVzZSBwaW5uZWRfaW5pdDo6e3Bpbl9k
YXRhLCBwaW5faW5pdCwgUGluSW5pdH07Cgp1c2UgcWVtdV9hcGk6OnsKICAgIG1lbW9yeTo6e01l
bW9yeVJlZ2lvbiwgTWVtb3J5UmVnaW9uT3BzLCBNZW1vcnlSZWdpb25PcHNCdWlsZGVyLCBod2Fk
ZHJ9LAogICAgY2VsbDo6QnFsUmVmQ2VsbCwKICAgIGNoYXJkZXY6OntDaGFyQmFja2VuZCwgQ2hh
ckJhY2tlbmRPcHMsIENoYXJkZXYsIEV2ZW50fSwKICAgIGlycTo6e0ludGVycnVwdFNvdXJjZSwg
SVJRU3RhdGV9LAogICAgcHJlbHVkZTo6KiwKICAgIHFkZXY6OntDbG9jaywgQ2xvY2tFdmVudCwg
RGV2aWNlSW1wbCwgRGV2aWNlU3RhdGUsIFByb3BlcnR5fSwKICAgIHFvbTo6e0NsYXNzSW5pdElt
cGwsIE9iamVjdEltcGwsIE9iamVjdFR5cGUsIE93bmVkfSwKICAgIHN5c2J1czo6e1N5c0J1c0Rl
dmljZSwgU3lzQnVzRGV2aWNlQ2xhc3N9LAogICAgcW9tX2lzYSwKfTsKCnVzZSBjcmF0ZTo6ewog
ICAgZGV2aWNlX2NsYXNzLAogICAgcmVnaXN0ZXJzOjp7c2VsZiwgSW50ZXJydXB0fSwKICAgIFJl
Z2lzdGVyT2Zmc2V0LAp9OwoKLy8vIEludGVnZXIgQmF1ZCBSYXRlIERpdmlkZXIsIGBVQVJUSUJS
RGAKY29uc3QgSUJSRF9NQVNLOiB1MzIgPSAweGZmZmY7CgovLy8gRnJhY3Rpb25hbCBCYXVkIFJh
dGUgRGl2aWRlciwgYFVBUlRGQlJEYApjb25zdCBGQlJEX01BU0s6IHUzMiA9IDB4M2Y7CgovLyBE
ZXB0aCBvZiBVQVJUIEZJRk8gaW4gYnl0ZXMsIHdoZW4gRklGTyBtb2RlIGlzIGVuYWJsZWQgKGVs
c2UgZGVwdGggPT0gMSkKY29uc3QgUEwwMTFfRklGT19ERVBUSDogdXNpemUgPSAxNjsKCiNbZGVy
aXZlKENsb25lLCBDb3B5KV0Kc3RydWN0IERldmljZUlkKCZhbXA7JiMzOTtzdGF0aWMgW3U4OyA4
XSk7CgppbXBsIERldmljZUlkIHsKICAgIGNvbnN0IEFSTTogU2VsZiA9IFNlbGYoJmFtcDtbMHgx
MSwgMHgxMCwgMHgxNCwgMHgwMCwgMHgwZCwgMHhmMCwgMHgwNSwgMHhiMV0pOwogICAgY29uc3Qg
TFVNSU5BUlk6IFNlbGYgPSBTZWxmKCZhbXA7WzB4MTEsIDB4MDAsIDB4MTgsIDB4MDEsIDB4MGQs
IDB4ZjAsIDB4MDUsIDB4YjFdKTsKfQoKaW1wbCBzdGQ6Om9wczo6SW5kZXgmbHQ7aHdhZGRyJmd0
OyBmb3IgRGV2aWNlSWQgewogICAgdHlwZSBPdXRwdXQgPSB1ODsKCiAgICBmbiBpbmRleCgmYW1w
O3NlbGYsIGlkeDogaHdhZGRyKSAtJmd0OyAmYW1wO1NlbGY6Ok91dHB1dCB7CiAgICAgICAgJmFt
cDtzZWxmLjBbaWR4IGFzIHVzaXplXQogICAgfQp9CgoKCgoKCgoKCgoKCgoKCgoKCgovLy8gV2hp
Y2ggYml0cyBpbiB0aGUgaW50ZXJydXB0IHN0YXR1cyBtYXR0ZXIgZm9yIGVhY2ggb3V0Ym91bmQg
SVJRIGxpbmUgPwpjb25zdCBJUlFNQVNLOiBbdTMyOyA2XSA9IFsKICAgIC8qIGNvbWJpbmVkIElS
USAqLwogICAgSW50ZXJydXB0OjpFLjAKICAgICAgICB8IEludGVycnVwdDo6TVMuMAogICAgICAg
IHwgSW50ZXJydXB0OjpSVC4wCiAgICAgICAgfCBJbnRlcnJ1cHQ6OlRYLjAKICAgICAgICB8IElu
dGVycnVwdDo6UlguMCwKICAgIEludGVycnVwdDo6UlguMCwKICAgIEludGVycnVwdDo6VFguMCwK
ICAgIEludGVycnVwdDo6UlQuMCwKICAgIEludGVycnVwdDo6TVMuMCwKICAgIEludGVycnVwdDo6
RS4wLApdOwoKI1tyZXByKEMpXQojW2Rlcml2ZShEZWJ1ZywgRGVmYXVsdCwgcWVtdV9hcGlfbWFj
cm9zOjpvZmZzZXRzKV0Kc3RydWN0IFBMMDExUmVnaXN0ZXJzIHsKICAgIHB1YiBmbGFnczogcmVn
aXN0ZXJzOjpGbGFncywKICAgIHB1YiBsaW5lX2NvbnRyb2w6IHJlZ2lzdGVyczo6TGluZUNvbnRy
b2wsCiAgICBwdWIgcmVjZWl2ZV9zdGF0dXNfZXJyb3JfY2xlYXI6IHJlZ2lzdGVyczo6UmVjZWl2
ZVN0YXR1c0Vycm9yQ2xlYXIsCiAgICBwdWIgY29udHJvbDogcmVnaXN0ZXJzOjpDb250cm9sLAog
ICAgcHViIGRtYWNyOiB1MzIsCiAgICBwdWIgaW50X2VuYWJsZWQ6IHUzMiwKICAgIHB1YiBpbnRf
bGV2ZWw6IHUzMiwKICAgIHB1YiByZWFkX2ZpZm86IFt1MzI7IFBMMDExX0ZJRk9fREVQVEhdLAog
ICAgcHViIGlscHI6IHUzMiwKICAgIHB1YiBpYnJkOiB1MzIsCiAgICBwdWIgZmJyZDogdTMyLAog
ICAgcHViIGlmbDogdTMyLAogICAgcHViIHJlYWRfcG9zOiB1c2l6ZSwKICAgIHB1YiByZWFkX2Nv
dW50OiB1c2l6ZSwKICAgIHB1YiByZWFkX3RyaWdnZXI6IHVzaXplLAp9CgojW3JlcHIoQyldCiNb
ZGVyaXZlKHFlbXVfYXBpX21hY3Jvczo6T2JqZWN0LCBxZW11X2FwaV9tYWNyb3M6Om9mZnNldHMp
XQojW3Bpbl9kYXRhXQovLy8gUEwwMTEgRGV2aWNlIE1vZGVsIGluIFFFTVUKcHViIHN0cnVjdCBQ
TDAxMVN0YXRlIHsKICAgICNbcGluXQogICAgcHViIHBhcmVudF9vYmo6IFN5c0J1c0RldmljZSwK
ICAgICNbcGluXQogICAgcHViIGlvbWVtOiBNZW1vcnlSZWdpb24sCiAgICAjW3Bpbl0KICAgIHB1
YiBjaGFyX2JhY2tlbmQ6IENoYXJCYWNrZW5kLAogICAgcHViIHJlZ3M6IEJxbFJlZkNlbGwmbHQ7
UEwwMTFSZWdpc3RlcnMmZ3Q7LAogICAgcHViIGludGVycnVwdHM6IFtJbnRlcnJ1cHRTb3VyY2U7
IElSUU1BU0subGVuKCldLAogICAgcHViIGNsb2NrOiBPd25lZCZsdDtDbG9jayZndDssCiAgICBw
dWIgbWlncmF0ZV9jbG9jazogYm9vbCwKfQoKcW9tX2lzYSEoUEwwMTFTdGF0ZSA6IFN5c0J1c0Rl
dmljZSwgRGV2aWNlU3RhdGUsIE9iamVjdCk7CgpwdWIgc3RydWN0IFBMMDExQ2xhc3MgewogICAg
cGFyZW50X2NsYXNzOiAmbHQ7U3lzQnVzRGV2aWNlIGFzIE9iamVjdFR5cGUmZ3Q7OjpDbGFzcywK
ICAgIC8vLyBUaGUgYnl0ZSBzdHJpbmcgdGhhdCBpZGVudGlmaWVzIHRoZSBkZXZpY2UuCiAgICBk
ZXZpY2VfaWQ6IERldmljZUlkLAp9Cgp1bnNhZmUgaW1wbCBPYmplY3RUeXBlIGZvciBQTDAxMVN0
YXRlIHsKICAgIHR5cGUgQ2xhc3MgPSBQTDAxMUNsYXNzOwogICAgY29uc3QgVFlQRV9OQU1FOiAm
YW1wOyYjMzk7c3RhdGljIENTdHIgPSBjcmF0ZTo6VFlQRV9QTDAxMTsKfQoKaW1wbCBDbGFzc0lu
aXRJbXBsJmx0O1BMMDExQ2xhc3MmZ3Q7IGZvciBQTDAxMVN0YXRlIHsKICAgIGZuIGNsYXNzX2lu
aXQoa2xhc3M6ICZhbXA7bXV0IFBMMDExQ2xhc3MpIHsKICAgICAgICBrbGFzcy5kZXZpY2VfaWQg
PSBEZXZpY2VJZDo6QVJNOwogICAgICAgICZsdDtTZWxmIGFzIENsYXNzSW5pdEltcGwmbHQ7U3lz
QnVzRGV2aWNlQ2xhc3MmZ3Q7Jmd0Ozo6Y2xhc3NfaW5pdCgmYW1wO211dCBrbGFzcy5wYXJlbnRf
Y2xhc3MpOwogICAgfQp9CgppbXBsIE9iamVjdEltcGwgZm9yIFBMMDExU3RhdGUgewogICAgdHlw
ZSBQYXJlbnRUeXBlID0gU3lzQnVzRGV2aWNlOwoKICAgIGNvbnN0IElOU1RBTkNFX1BPU1RfSU5J
VDogT3B0aW9uJmx0O2ZuKCZhbXA7U2VsZikmZ3Q7ID0gU29tZShTZWxmOjpwb3N0X2luaXQpOwoK
ICAgIGZuIGluc3RhbmNlX2luaXQocGFyZW50X2luaXQ6IGltcGwgUGluSW5pdCZsdDtTeXNCdXNE
ZXZpY2UmZ3Q7KSAtJmd0OyBpbXBsIFBpbkluaXQmbHQ7U2VsZiZndDsgewogICAgICAgICBzdGF0
aWMgUEwwMTFfT1BTOiBNZW1vcnlSZWdpb25PcHMgPSBNZW1vcnlSZWdpb25PcHNCdWlsZGVyOjom
bHQ7UEwwMTFTdGF0ZSZndDs6Om5ldygpCiAgICAgICAgICAgICAucmVhZCgmYW1wO1BMMDExU3Rh
dGU6OnJlYWQpCiAgICAgICAgICAgICAud3JpdGUoJmFtcDtQTDAxMVN0YXRlOjp3cml0ZSkKICAg
ICAgICAgICAgIC5uYXRpdmVfZW5kaWFuKCkKICAgICAgICAgICAgIC5pbXBsX3NpemVzKDQsIDQp
CiAgICAgICAgICAgICAuYnVpbGQoKTsKCiAgICAgICAgcGluX2luaXQhKCZhbXA7dGhpcyBpbiBQ
TDAxMVN0YXRlIHsKICAgICAgICAgICAgcGFyZW50X29iaiAmbHQ7LSBwYXJlbnRfaW5pdCwKICAg
ICAgICAgICAgaW9tZW0gJmx0Oy0gTWVtb3J5UmVnaW9uOjppbml0X2lvKAogICAgICAgICAgICAg
ICAgdGhpcywgJmFtcDtQTDAxMV9PUFMsICZxdW90O3BsMDExJnF1b3Q7LCAweDEwMDAsCiAgICAg
ICAgICAgICksCiAgICAgICAgICAgIGNoYXJfYmFja2VuZCAmbHQ7LSBDaGFyQmFja2VuZDo6bmV3
KCksCiAgICAgICAgICAgIHJlZ3M6IERlZmF1bHQ6OmRlZmF1bHQoKSwKICAgICAgICAgICAgaW50
ZXJydXB0czogRGVmYXVsdDo6ZGVmYXVsdCgpLAogICAgICAgICAgICBjbG9jayAmbHQ7LSBTZWxm
Ojppbml0X2Nsb2NrX2luKHRoaXMsICZxdW90O2NsayZxdW90OywKCSAgICAgICAgJmFtcDtTZWxm
OjpjbG9ja191cGRhdGUsCgkJQ2xvY2tFdmVudDo6Q2xvY2tVcGRhdGUpLAogICAgICAgICAgICBt
aWdyYXRlX2Nsb2NrOiBmYWxzZSwKICAgICAgICB9KQogICAgfQp9CgoKaW1wbCBEZXZpY2VJbXBs
IGZvciBQTDAxMVN0YXRlIHsKICAgIGZuIHByb3BlcnRpZXMoKSAtJmd0OyAmYW1wOyYjMzk7c3Rh
dGljIFtQcm9wZXJ0eV0gewogICAgICAgICZhbXA7ZGV2aWNlX2NsYXNzOjpQTDAxMV9QUk9QRVJU
SUVTCiAgICB9CgogICAgZm4gdm1zZCgpIC0mZ3Q7IE9wdGlvbiZsdDsmYW1wOyYjMzk7c3RhdGlj
IFZNU3RhdGVEZXNjcmlwdGlvbiZndDsgewogICAgICAgIFNvbWUoJmFtcDtkZXZpY2VfY2xhc3M6
OlZNU1RBVEVfUEwwMTEpCiAgICB9CiAgICBjb25zdCBSRUFMSVpFOiBPcHRpb24mbHQ7Zm4oJmFt
cDtTZWxmKSZndDsgPSBTb21lKFNlbGY6OnJlYWxpemUpOwogICAgY29uc3QgUkVTRVQ6IE9wdGlv
biZsdDtmbigmYW1wO1NlbGYpJmd0OyA9IFNvbWUoU2VsZjo6cmVzZXQpOwp9CgoKCgoKCmltcGwg
Q2hhckJhY2tlbmRPcHMmbHQ7JiMzOTtfJmd0OyBmb3IgUEwwMTFTdGF0ZSB7CiAgICBmbiBjYW5f
cmVjZWl2ZSgmYW1wO3NlbGYpIC0mZ3Q7IHUzMiB7CiAgICAgICAgbGV0IHJlZ3MgPSBzZWxmLnJl
Z3MuYm9ycm93KCk7CiAgICAgICAgLy8gdHJhY2VfcGwwMTFfY2FuX3JlY2VpdmUocy0mZ3Q7bGNy
LCBzLSZndDtyZWFkX2NvdW50LCByKTsKICAgICAgICB1MzI6OmZyb20ocmVncy5yZWFkX2NvdW50
ICZsdDsgcmVncy5maWZvX2RlcHRoKCkpCiAgICB9CgoKCgogICAgZm4gZXZlbnQoJmFtcDtzZWxm
LCBldmVudDogRXZlbnQpIHsKICAgICAgICBsZXQgbXV0IHJlZ3MgPSBzZWxmLnJlZ3MuYm9ycm93
X211dCgpOwogICAgICAgIGlmIGV2ZW50ID09IEV2ZW50OjpDSFJfRVZFTlRfQlJFQUsgJmFtcDsm
YW1wOyAhcmVncy5sb29wYmFja19lbmFibGVkKCkgewogICAgICAgICAgICBpZiByZWdzLnB1dF9m
aWZvKHUzMjo6ZnJvbShyZWdpc3RlcnM6OkRhdGE6OkJSRUFLKSkgewogICAgICAgICAgICAgICAg
c2VsZi51cGRhdGUoKTsKICAgICAgICAgICAgfQogICAgICAgIH0KICAgIH0KCiAgICBmbiByZWNl
aXZlKCZhbXA7c2VsZiwgYnVmOiAmYW1wO1t1OF0pIHsKICAgICAgICBsZXQgbXV0IHJlZ3MgPSBz
ZWxmLnJlZ3MuYm9ycm93X211dCgpOwogICAgICAgIGlmICFyZWdzLmxvb3BiYWNrX2VuYWJsZWQo
KSAmYW1wOyZhbXA7ICFidWYuaXNfZW1wdHkoKSAmYW1wOyZhbXA7IHJlZ3MucHV0X2ZpZm8oYnVm
WzBdLmludG8oKSkgewogICAgICAgICAgICBzZWxmLnVwZGF0ZSgpOwogICAgICAgIH0KICAgIH0K
fQoKCgoKCgppbXBsIFBMMDExUmVnaXN0ZXJzIHsKICAgIHB1YiBmbiByZWFkKCZhbXA7bXV0IHNl
bGYsIG9mZnNldDogUmVnaXN0ZXJPZmZzZXQpIC0mZ3Q7IENvbnRyb2xGbG93Jmx0O3UzMiwgdTMy
Jmd0OyB7CiAgICAgICAgdXNlIFJlZ2lzdGVyT2Zmc2V0OjoqOwoKCgoKICAgICAgICBDb250cm9s
Rmxvdzo6QnJlYWsobWF0Y2ggb2Zmc2V0IHsKICAgICAgICAgICAgRFIgPSZndDsgewogICAgICAg
ICAgICAgICAgc2VsZi5mbGFncy5zZXRfcmVjZWl2ZV9maWZvX2Z1bGwoZmFsc2UpOwogICAgICAg
ICAgICAgICAgbGV0IGMgPSBzZWxmLnJlYWRfZmlmb1tzZWxmLnJlYWRfcG9zXTsKICAgICAgICAg
ICAgICAgIGlmIHNlbGYucmVhZF9jb3VudCAmZ3Q7IDAgewogICAgICAgICAgICAgICAgICAgIHNl
bGYucmVhZF9jb3VudCAtPSAxOwogICAgICAgICAgICAgICAgICAgIHNlbGYucmVhZF9wb3MgPSAo
c2VsZi5yZWFkX3BvcyArIDEpICZhbXA7IChzZWxmLmZpZm9fZGVwdGgoKSAtIDEpOwogICAgICAg
ICAgICAgICAgfQogICAgICAgICAgICAgICAgaWYgc2VsZi5yZWFkX2NvdW50ID09IDAgewogICAg
ICAgICAgICAgICAgICAgIHNlbGYuZmxhZ3Muc2V0X3JlY2VpdmVfZmlmb19lbXB0eSh0cnVlKTsK
ICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIGlmIHNlbGYucmVhZF9jb3VudCArIDEg
PT0gc2VsZi5yZWFkX3RyaWdnZXIgewogICAgICAgICAgICAgICAgICAgIHNlbGYuaW50X2xldmVs
ICZhbXA7PSAhSW50ZXJydXB0OjpSWC4wOwogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAg
ICAgLy8gVXBkYXRlIGVycm9yIGJpdHMuCgkJc2VsZi5yZWNlaXZlX3N0YXR1c19lcnJvcl9jbGVh
ciA9IHJlZ2lzdGVyczo6RGF0YTo6ZnJvbShjKS5lcnJvcnMoKTsKICAgICAgICAgICAgICAgIC8v
IE11c3QgY2FsbCBxZW11X2Nocl9mZV9hY2NlcHRfaW5wdXQsIHNvIHJldHVybiBDb250aW51ZToK
ICAgICAgICAgICAgICAgIHJldHVybiBDb250cm9sRmxvdzo6Q29udGludWUoYyk7CiAgICAgICAg
ICAgIH0KICAgICAgICAgICAgUlNSID0mZ3Q7IHU4Ojpmcm9tKHNlbGYucmVjZWl2ZV9zdGF0dXNf
ZXJyb3JfY2xlYXIpLmludG8oKSwKICAgICAgICAgICAgRlIgPSZndDsgdTE2Ojpmcm9tKHNlbGYu
ZmxhZ3MpLmludG8oKSwKICAgICAgICAgICAgRkJSRCA9Jmd0OyBzZWxmLmZicmQsCiAgICAgICAg
ICAgIElMUFIgPSZndDsgc2VsZi5pbHByLAogICAgICAgICAgICBJQlJEID0mZ3Q7IHNlbGYuaWJy
ZCwKICAgICAgICAgICAgTENSX0ggPSZndDsgdTE2Ojpmcm9tKHNlbGYubGluZV9jb250cm9sKS5p
bnRvKCksCiAgICAgICAgICAgIENSID0mZ3Q7IHUxNjo6ZnJvbShzZWxmLmNvbnRyb2wpLmludG8o
KSwKICAgICAgICAgICAgRkxTID0mZ3Q7IHNlbGYuaWZsLAogICAgICAgICAgICBJTVNDID0mZ3Q7
IHNlbGYuaW50X2VuYWJsZWQsCiAgICAgICAgICAgIFJJUyA9Jmd0OyBzZWxmLmludF9sZXZlbCwK
ICAgICAgICAgICAgTUlTID0mZ3Q7IHNlbGYuaW50X2xldmVsICZhbXA7IHNlbGYuaW50X2VuYWJs
ZWQsCiAgICAgICAgICAgIElDUiA9Jmd0OyB7CiAgICAgICAgICAgICAgICAvLyAmcXVvdDtUaGUg
VUFSVElDUiBSZWdpc3RlciBpcyB0aGUgaW50ZXJydXB0IGNsZWFyIHJlZ2lzdGVyIGFuZCBpcyB3
cml0ZS1vbmx5JnF1b3Q7CiAgICAgICAgICAgICAgICAvLyBTb3VyY2U6IEFSTSBEREkgMDE4M0cg
My4zLjEzIEludGVycnVwdCBDbGVhciBSZWdpc3RlciwgVUFSVElDUgogICAgICAgICAgICAgICAg
MAogICAgICAgICAgICB9CiAgICAgICAgICAgIERNQUNSID0mZ3Q7IHNlbGYuZG1hY3IsCiAgICAg
ICAgfSkKICAgIH0KCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCiAgICBwdWIgZm4gd3Jp
dGUoCiAgICAgICAgJmFtcDttdXQgc2VsZiwKICAgICAgICBvZmZzZXQ6IFJlZ2lzdGVyT2Zmc2V0
LAogICAgICAgIHZhbHVlOiB1MzIsCiAgICAgICAgY2hhcl9iYWNrZW5kOiAmYW1wO0NoYXJCYWNr
ZW5kLAogICAgKSAtJmd0OyBib29sIHsKICAgICAgICAvLyBlcHJpbnRsbiEoJnF1b3Q7d3JpdGUg
b2Zmc2V0IHtvZmZzZXR9IHZhbHVlIHt2YWx1ZX0mcXVvdDspOwogICAgICAgIHVzZSBSZWdpc3Rl
ck9mZnNldDo6KjsKICAgICAgICBtYXRjaCBvZmZzZXQgewogICAgICAgICAgICBEUiA9Jmd0OyB7
CiAgICAgICAgICAgICAgICAvLyA/Pz8gQ2hlY2sgaWYgdHJhbnNtaXR0ZXIgaXMgZW5hYmxlZC4K
ICAgICAgICAgICAgICAgIGxldCBjaDogW3U4OyAxXSA9IFt2YWx1ZSBhcyB1OF07CiAgICAgICAg
ICAgICAgICAvLyBYWFggdGhpcyBibG9ja3MgZW50aXJlIHRocmVhZC4gUmV3cml0ZSB0byB1c2UK
ICAgICAgICAgICAgICAgIC8vIHFlbXVfY2hyX2ZlX3dyaXRlIGFuZCBiYWNrZ3JvdW5kIEkvTyBj
YWxsYmFja3MKICAgICAgICAgICAgICAgIGxldCBfID0gY2hhcl9iYWNrZW5kLndyaXRlX2FsbCgm
YW1wO2NoKTsKICAgICAgICAgICAgICAgIC8vIGludGVycnVwdHMgYWx3YXlzIGNoZWNrZWQKICAg
ICAgICAgICAgICAgIGxldCBfID0gc2VsZi5sb29wYmFja190eCh2YWx1ZSk7CiAgICAgICAgICAg
ICAgICBzZWxmLmludF9sZXZlbCB8PSBJbnRlcnJ1cHQ6OlRYLjA7CiAgICAgICAgICAgICAgICBy
ZXR1cm4gdHJ1ZTsKICAgICAgICAgICAgfQogICAgICAgICAgICBSU1IgPSZndDsgewogICAgICAg
ICAgICAgICAgc2VsZi5yZWNlaXZlX3N0YXR1c19lcnJvcl9jbGVhci5yZXNldCgpOwogICAgICAg
ICAgICB9CiAgICAgICAgICAgIEZSID0mZ3Q7IHsKICAgICAgICAgICAgICAgIC8vIGZsYWcgd3Jp
dGVzIGFyZSBpZ25vcmVkCiAgICAgICAgICAgIH0KICAgICAgICAgICAgSUxQUiA9Jmd0OyB7CiAg
ICAgICAgICAgICAgICBzZWxmLmlscHIgPSB2YWx1ZTsKICAgICAgICAgICAgfQogICAgICAgICAg
ICBJQlJEID0mZ3Q7IHsKICAgICAgICAgICAgICAgIHNlbGYuaWJyZCA9IHZhbHVlOwogICAgICAg
ICAgICB9CiAgICAgICAgICAgIEZCUkQgPSZndDsgewogICAgICAgICAgICAgICAgc2VsZi5mYnJk
ID0gdmFsdWU7CiAgICAgICAgICAgIH0KICAgICAgICAgICAgTENSX0ggPSZndDsgewogICAgICAg
ICAgICAgICAgbGV0IHZhbHVlID0gdmFsdWUgYXMgdTE2OwogICAgICAgICAgICAgICAgbGV0IG5l
d192YWw6IHJlZ2lzdGVyczo6TGluZUNvbnRyb2wgPSB2YWx1ZS5pbnRvKCk7CiAgICAgICAgICAg
ICAgICAvLyBSZXNldCB0aGUgRklGTyBzdGF0ZSBvbiBGSUZPIGVuYWJsZSBvciBkaXNhYmxlCgkJ
aWYgc2VsZi5saW5lX2NvbnRyb2wuZmlmb3NfZW5hYmxlZCgpICE9IG5ld192YWwuZmlmb3NfZW5h
YmxlZCgpIHsKICAgICAgICAgICAgICAgICAgICBzZWxmLnJlc2V0X3J4X2ZpZm8oKTsKICAgICAg
ICAgICAgICAgIH0KICAgICAgICAgICAgICAgIGxldCB1cGRhdGUgPSAoc2VsZi5saW5lX2NvbnRy
b2wuc2VuZF9icmVhaygpICE9IG5ld192YWwuc2VuZF9icmVhaygpKSAmYW1wOyZhbXA7IHsKICAg
ICAgICAgICAgICAgICAgICBsZXQgYnJlYWtfZW5hYmxlID0gbmV3X3ZhbC5zZW5kX2JyZWFrKCk7
CiAgICAgICAgICAgICAgICAgICAgbGV0IF8gPSBjaGFyX2JhY2tlbmQuc2VuZF9icmVhayhicmVh
a19lbmFibGUpOwogICAgICAgICAgICAgICAgICAgIHNlbGYubG9vcGJhY2tfYnJlYWsoYnJlYWtf
ZW5hYmxlKQogICAgICAgICAgICAgICAgfTsKICAgICAgICAgICAgICAgIHNlbGYubGluZV9jb250
cm9sID0gbmV3X3ZhbDsKICAgICAgICAgICAgICAgIHNlbGYuc2V0X3JlYWRfdHJpZ2dlcigpOwog
ICAgICAgICAgICAgICAgcmV0dXJuIHVwZGF0ZTsKICAgICAgICAgICAgfQogICAgICAgICAgICBD
UiA9Jmd0OyB7CiAgICAgICAgICAgICAgICAvLyA/Pz8gTmVlZCB0byBpbXBsZW1lbnQgdGhlIGVu
YWJsZSBiaXQuCiAgICAgICAgICAgICAgICBsZXQgdmFsdWUgPSB2YWx1ZSBhcyB1MTY7CiAgICAg
ICAgICAgICAgICBzZWxmLmNvbnRyb2wgPSB2YWx1ZS5pbnRvKCk7CiAgICAgICAgICAgICAgICBy
ZXR1cm4gc2VsZi5sb29wYmFja19tZG1jdHJsKCk7CiAgICAgICAgICAgIH0KICAgICAgICAgICAg
RkxTID0mZ3Q7IHsKICAgICAgICAgICAgICAgIHNlbGYuaWZsID0gdmFsdWU7CiAgICAgICAgICAg
ICAgICBzZWxmLnNldF9yZWFkX3RyaWdnZXIoKTsKICAgICAgICAgICAgfQogICAgICAgICAgICBJ
TVNDID0mZ3Q7IHsKICAgICAgICAgICAgICAgIHNlbGYuaW50X2VuYWJsZWQgPSB2YWx1ZTsKICAg
ICAgICAgICAgICAgIHJldHVybiB0cnVlOwogICAgICAgICAgICB9CiAgICAgICAgICAgIFJJUyA9
Jmd0OyB7fQogICAgICAgICAgICBNSVMgPSZndDsge30KICAgICAgICAgICAgSUNSID0mZ3Q7IHsK
ICAgICAgICAgICAgICAgIHNlbGYuaW50X2xldmVsICZhbXA7PSAhdmFsdWU7CiAgICAgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsKICAgICAgICAgICAgfQogICAgICAgICAgICBETUFDUiA9Jmd0OyB7
CiAgICAgICAgICAgICAgICBzZWxmLmRtYWNyID0gdmFsdWU7CiAgICAgICAgICAgICAgICBpZiB2
YWx1ZSAmYW1wOyAzICZndDsgMCB7CiAgICAgICAgICAgICAgICAgICAgLy8gcWVtdV9sb2dfbWFz
ayhMT0dfVU5JTVAsICZxdW90O3BsMDExOiBETUEgbm90IGltcGxlbWVudGVkXG4mcXVvdDspOwog
ICAgICAgICAgICAgICAgICAgIGVwcmludGxuISgmcXVvdDtwbDAxMTogRE1BIG5vdCBpbXBsZW1l
bnRlZCZxdW90Oyk7CiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KICAgICAgICB9CiAg
ICAgICAgZmFsc2UKICAgIH0KCgoKICAgICNbaW5saW5lXQogICAgI1ttdXN0X3VzZV0KICAgIGZu
IGxvb3BiYWNrX3R4KCZhbXA7bXV0IHNlbGYsIHZhbHVlOiB1MzIpIC0mZ3Q7IGJvb2wgewogICAg
ICAgIC8vIENhdmVhdDoKICAgICAgICAvLwogICAgICAgIC8vIEluIHJlYWwgaGFyZHdhcmUsIFRY
IGxvb3BiYWNrIGhhcHBlbnMgYXQgdGhlIHNlcmlhbC1iaXQgbGV2ZWwKICAgICAgICAvLyBhbmQg
dGhlbiByZWFzc2VtYmxlZCBieSB0aGUgUlggbG9naWNzIGJhY2sgaW50byBieXRlcyBhbmQgcGxh
Y2VkCiAgICAgICAgLy8gaW50byB0aGUgUlggZmlmby4gVGhhdCBpcywgbG9vcGJhY2sgaGFwcGVu
cyBhZnRlciBUWCBmaWZvLgogICAgICAgIC8vCiAgICAgICAgLy8gQmVjYXVzZSB0aGUgcmVhbCBo
YXJkd2FyZSBUWCBmaWZvIGlzIHRpbWUtZHJhaW5lZCBhdCB0aGUgZnJhbWUKICAgICAgICAvLyBy
YXRlIGdvdmVybmVkIGJ5IHRoZSBjb25maWd1cmVkIHNlcmlhbCBmb3JtYXQsIHNvbWUgbG9vcGJh
Y2sKICAgICAgICAvLyBieXRlcyBpbiBUWCBmaWZvIG1heSBzdGlsbCBiZSBhYmxlIHRvIGdldCBp
bnRvIHRoZSBSWCBmaWZvCiAgICAgICAgLy8gdGhhdCBjb3VsZCBiZSBmdWxsIGF0IHRpbWVzIHdo
aWxlIGJlaW5nIGRyYWluZWQgYXQgc29mdHdhcmUKICAgICAgICAvLyBwYWNlLgogICAgICAgIC8v
CiAgICAgICAgLy8gSW4gc3VjaCBzY2VuYXJpbywgdGhlIFJYIGRyYWluaW5nIHBhY2UgaXMgdGhl
IG1ham9yIGZhY3RvcgogICAgICAgIC8vIGRlY2lkaW5nIHdoaWNoIGxvb3BiYWNrIGJ5dGVzIGdl
dCBpbnRvIHRoZSBSWCBmaWZvLCB1bmxlc3MKICAgICAgICAvLyBoYXJkd2FyZSBmbG93LWNvbnRy
b2wgaXMgZW5hYmxlZC4KICAgICAgICAvLwogICAgICAgIC8vIEZvciBzaW1wbGljaXR5LCB0aGUg
YWJvdmUgZGVzY3JpYmVkIGlzIG5vdCBlbXVsYXRlZC4KICAgICAgICBzZWxmLmxvb3BiYWNrX2Vu
YWJsZWQoKSAmYW1wOyZhbXA7IHNlbGYucHV0X2ZpZm8odmFsdWUpCiAgICB9CgoKCgoKICAgICNb
bXVzdF91c2VdCiAgICBmbiBsb29wYmFja19tZG1jdHJsKCZhbXA7bXV0IHNlbGYpIC0mZ3Q7IGJv
b2wgewogICAgICAgIGlmICFzZWxmLmxvb3BiYWNrX2VuYWJsZWQoKSB7CiAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsKICAgICAgICB9CgogICAgICAgIC8qCiAgICAgICAgICogTG9vcGJhY2sgc29m
dHdhcmUtZHJpdmVuIG1vZGVtIGNvbnRyb2wgb3V0cHV0cyB0byBtb2RlbSBzdGF0dXMgaW5wdXRz
OgogICAgICAgICAqICAgRlIuUkkgICZsdDs9IENSLk91dDIKICAgICAgICAgKiAgIEZSLkRDRCAm
bHQ7PSBDUi5PdXQxCiAgICAgICAgICogICBGUi5DVFMgJmx0Oz0gQ1IuUlRTCiAgICAgICAgICog
ICBGUi5EU1IgJmx0Oz0gQ1IuRFRSCiAgICAgICAgICoKICAgICAgICAgKiBUaGUgbG9vcGJhY2sg
aGFwcGVucyBpbW1lZGlhdGVseSBldmVuIGlmIHRoaXMgY2FsbCBpcyB0cmlnZ2VyZWQKICAgICAg
ICAgKiBieSBzZXR0aW5nIG9ubHkgQ1IuTEJFLgogICAgICAgICAqCiAgICAgICAgICogQ1RTL1JU
UyB1cGRhdGVzIGR1ZSB0byBlbmFibGVkIGhhcmR3YXJlIGZsb3cgY29udHJvbHMgYXJlIG5vdAog
ICAgICAgICAqIGRlYWx0IHdpdGggaGVyZS4KICAgICAgICAgKi8KCiAgICAgICAgc2VsZi5mbGFn
cy5zZXRfcmluZ19pbmRpY2F0b3Ioc2VsZi5jb250cm9sLm91dF8yKCkpOwogICAgICAgIHNlbGYu
ZmxhZ3Muc2V0X2RhdGFfY2Fycmllcl9kZXRlY3Qoc2VsZi5jb250cm9sLm91dF8xKCkpOwogICAg
ICAgIHNlbGYuZmxhZ3Muc2V0X2NsZWFyX3RvX3NlbmQoc2VsZi5jb250cm9sLnJlcXVlc3RfdG9f
c2VuZCgpKTsKICAgICAgICBzZWxmLmZsYWdzCiAgICAgICAgICAgIC5zZXRfZGF0YV9zZXRfcmVh
ZHkoc2VsZi5jb250cm9sLmRhdGFfdHJhbnNtaXRfcmVhZHkoKSk7CgogICAgICAgIC8vIENoYW5n
ZSBpbnRlcnJ1cHRzIGJhc2VkIG9uIHVwZGF0ZWQgRlIKICAgICAgICBsZXQgbXV0IGlsID0gc2Vs
Zi5pbnRfbGV2ZWw7CgogICAgICAgIGlsICZhbXA7PSAhSW50ZXJydXB0OjpNUy4wOwoKICAgICAg
ICBpZiBzZWxmLmZsYWdzLmRhdGFfc2V0X3JlYWR5KCkgewogICAgICAgICAgICBpbCB8PSBJbnRl
cnJ1cHQ6OkRTUi4wOwogICAgICAgIH0KICAgICAgICBpZiBzZWxmLmZsYWdzLmRhdGFfY2Fycmll
cl9kZXRlY3QoKSB7CiAgICAgICAgICAgIGlsIHw9IEludGVycnVwdDo6RENELjA7CiAgICAgICAg
fQogICAgICAgIGlmIHNlbGYuZmxhZ3MuY2xlYXJfdG9fc2VuZCgpIHsKICAgICAgICAgICAgaWwg
fD0gSW50ZXJydXB0OjpDVFMuMDsKICAgICAgICB9CiAgICAgICAgaWYgc2VsZi5mbGFncy5yaW5n
X2luZGljYXRvcigpIHsKICAgICAgICAgICAgaWwgfD0gSW50ZXJydXB0OjpSSS4wOwogICAgICAg
IH0KICAgICAgICBzZWxmLmludF9sZXZlbCA9IGlsOwogICAgICAgIHRydWUKICAgIH0KCiAgICBm
biBsb29wYmFja19icmVhaygmYW1wO211dCBzZWxmLCBlbmFibGU6IGJvb2wpIC0mZ3Q7IGJvb2wg
ewogICAgICAgIGVuYWJsZSAmYW1wOyZhbXA7IHNlbGYubG9vcGJhY2tfdHgodTMyOjpmcm9tKHJl
Z2lzdGVyczo6RGF0YTo6QlJFQUspKQogICAgfQoKCgoKICAgIGZuIHNldF9yZWFkX3RyaWdnZXIo
JmFtcDttdXQgc2VsZikgewogICAgICAgIHNlbGYucmVhZF90cmlnZ2VyID0gMTsKICAgIH0KCgoK
CgoKCgoKCgogICAgcHViIGZuIHJlc2V0KCZhbXA7bXV0IHNlbGYpIHsKCgoKICAgICAgICBzZWxm
LmxpbmVfY29udHJvbC5yZXNldCgpOwogICAgICAgIHNlbGYucmVjZWl2ZV9zdGF0dXNfZXJyb3Jf
Y2xlYXIucmVzZXQoKTsKICAgICAgICBzZWxmLmRtYWNyID0gMDsKICAgICAgICBzZWxmLmludF9l
bmFibGVkID0gMDsKICAgICAgICBzZWxmLmludF9sZXZlbCA9IDA7CiAgICAgICAgc2VsZi5pbHBy
ID0gMDsKICAgICAgICBzZWxmLmlicmQgPSAwOwogICAgICAgIHNlbGYuZmJyZCA9IDA7CiAgICAg
ICAgc2VsZi5yZWFkX3RyaWdnZXIgPSAxOwogICAgICAgIHNlbGYuaWZsID0gMHgxMjsKICAgICAg
ICBzZWxmLmNvbnRyb2wucmVzZXQoKTsKICAgICAgICBzZWxmLmZsYWdzLnJlc2V0KCk7CiAgICAg
ICAgc2VsZi5yZXNldF9yeF9maWZvKCk7CiAgICB9CgogICAgcHViIGZuIHJlc2V0X3J4X2ZpZm8o
JmFtcDttdXQgc2VsZikgewogICAgICAgIHNlbGYucmVhZF9jb3VudCA9IDA7CiAgICAgICAgc2Vs
Zi5yZWFkX3BvcyA9IDA7CgogICAgICAgIC8qIFJlc2V0IHJlY2VpdmUgRklGTyBmbGFncyAqLwog
ICAgICAgIHNlbGYuZmxhZ3Muc2V0X3JlY2VpdmVfZmlmb19mdWxsKGZhbHNlKTsKICAgICAgICBz
ZWxmLmZsYWdzLnNldF9yZWNlaXZlX2ZpZm9fZW1wdHkodHJ1ZSk7CiAgICB9CgogICAgI1tpbmxp
bmVdCiAgICBwdWIgZm4gZmlmb19lbmFibGVkKCZhbXA7c2VsZikgLSZndDsgYm9vbCB7CiAgICAg
ICAgc2VsZi5saW5lX2NvbnRyb2wuZmlmb3NfZW5hYmxlZCgpID09IHJlZ2lzdGVyczo6TW9kZTo6
RklGTwogICAgfQoKICAgICNbaW5saW5lXQogICAgcHViIGZuIGxvb3BiYWNrX2VuYWJsZWQoJmFt
cDtzZWxmKSAtJmd0OyBib29sIHsKICAgICAgICBzZWxmLmNvbnRyb2wuZW5hYmxlX2xvb3BiYWNr
KCkKICAgIH0KCiAgICAjW2lubGluZV0KICAgIHB1YiBmbiBmaWZvX2RlcHRoKCZhbXA7c2VsZikg
LSZndDsgdXNpemUgewogICAgICAgIC8vIE5vdGU6IEZJRk8gZGVwdGggaXMgZXhwZWN0ZWQgdG8g
YmUgcG93ZXItb2YtMgogICAgICAgIGlmIHNlbGYuZmlmb19lbmFibGVkKCkgewogICAgICAgICAg
ICByZXR1cm4gUEwwMTFfRklGT19ERVBUSDsKICAgICAgICB9CiAgICAgICAgMQogICAgfQoKICAg
ICNbbXVzdF91c2VdCiAgICBwdWIgZm4gcHV0X2ZpZm8oJmFtcDttdXQgc2VsZiwgdmFsdWU6IHUz
MikgLSZndDsgYm9vbCB7CgoKCgogICAgICAgIGxldCBkZXB0aCA9IHNlbGYuZmlmb19kZXB0aCgp
OwogICAgICAgIGFzc2VydCEoZGVwdGggJmd0OyAwKTsKICAgICAgICBsZXQgc2xvdCA9IChzZWxm
LnJlYWRfcG9zICsgc2VsZi5yZWFkX2NvdW50KSAmYW1wOyAoZGVwdGggLSAxKTsKICAgICAgICBz
ZWxmLnJlYWRfZmlmb1tzbG90XSA9IHZhbHVlOwogICAgICAgIHNlbGYucmVhZF9jb3VudCArPSAx
OwogICAgICAgIHNlbGYuZmxhZ3Muc2V0X3JlY2VpdmVfZmlmb19lbXB0eShmYWxzZSk7CiAgICAg
ICAgaWYgc2VsZi5yZWFkX2NvdW50ID09IGRlcHRoIHsKICAgICAgICAgICAgc2VsZi5mbGFncy5z
ZXRfcmVjZWl2ZV9maWZvX2Z1bGwodHJ1ZSk7CiAgICAgICAgfQoKICAgICAgICBpZiBzZWxmLnJl
YWRfY291bnQgPT0gc2VsZi5yZWFkX3RyaWdnZXIgewogICAgICAgICAgICBzZWxmLmludF9sZXZl
bCB8PSBJbnRlcnJ1cHQ6OlJYLjA7CiAgICAgICAgICAgIHJldHVybiB0cnVlOwogICAgICAgIH0K
ICAgICAgICBmYWxzZQogICAgfQoKICAgIHB1YiBmbiBwb3N0X2xvYWQoJmFtcDttdXQgc2VsZikg
LSZndDsgUmVzdWx0Jmx0OygpLCAoKSZndDsgewogICAgICAgIC8qIFNhbml0eS1jaGVjayBpbnB1
dCBzdGF0ZSAqLwogICAgICAgIGlmIHNlbGYucmVhZF9wb3MgJmd0Oz0gc2VsZi5yZWFkX2ZpZm8u
bGVuKCkgfHwgc2VsZi5yZWFkX2NvdW50ICZndDsgc2VsZi5yZWFkX2ZpZm8ubGVuKCkgewogICAg
ICAgICAgICByZXR1cm4gRXJyKCgpKTsKICAgICAgICB9CgogICAgICAgIGlmICFzZWxmLmZpZm9f
ZW5hYmxlZCgpICZhbXA7JmFtcDsgc2VsZi5yZWFkX2NvdW50ICZndDsgMCAmYW1wOyZhbXA7IHNl
bGYucmVhZF9wb3MgJmd0OyAwIHsKICAgICAgICAgICAgLy8gT2xkZXIgdmVyc2lvbnMgb2YgUEww
MTEgZGlkbiYjMzk7dCBlbnN1cmUgdGhhdCB0aGUgc2luZ2xlCiAgICAgICAgICAgIC8vIGNoYXJh
Y3RlciBpbiB0aGUgRklGTyBpbiBGSUZPLWRpc2FibGVkIG1vZGUgaXMgaW4KICAgICAgICAgICAg
Ly8gZWxlbWVudCAwIG9mIHRoZSBhcnJheTsgY29udmVydCB0byBmb2xsb3cgdGhlIGN1cnJlbnQK
ICAgICAgICAgICAgLy8gY29kZSYjMzk7cyBhc3N1bXB0aW9ucy4KICAgICAgICAgICAgc2VsZi5y
ZWFkX2ZpZm9bMF0gPSBzZWxmLnJlYWRfZmlmb1tzZWxmLnJlYWRfcG9zXTsKICAgICAgICAgICAg
c2VsZi5yZWFkX3BvcyA9IDA7CiAgICAgICAgfQoKICAgICAgICBzZWxmLmlicmQgJmFtcDs9IElC
UkRfTUFTSzsKICAgICAgICBzZWxmLmZicmQgJmFtcDs9IEZCUkRfTUFTSzsKCiAgICAgICAgT2so
KCkpCiAgICB9Cn0KCgoKCgoKCgppbXBsIFBMMDExU3RhdGUgewogICAgZm4gY2xvY2tfdXBkYXRl
KCZhbXA7c2VsZiwgX2V2ZW50OiBDbG9ja0V2ZW50KSB7CiAgICAgICAgLyogcGwwMTFfdHJhY2Vf
YmF1ZHJhdGVfY2hhbmdlKHMpOyAqLwogICAgfQoKCgogICAgPGVtPi8vIHBhcnQgb2YgcGwwMTFf
aW5pdCBpbiBDOiA8L2VtPgogICAgZm4gcG9zdF9pbml0KCZhbXA7c2VsZikgewogICAgICAgIHNl
bGYuaW5pdF9tbWlvKCZhbXA7c2VsZi5pb21lbSk7CiAgICAgICAgZm9yIGlycSBpbiBzZWxmLmlu
dGVycnVwdHMuaXRlcigpIHsKICAgICAgICAgICAgc2VsZi5pbml0X2lycShpcnEpOwogICAgICAg
IH0KICAgIH0KCiAgICA8ZW0+Ly8gcGFydCBvZiBwbDAxMV9yZWFkIGluIEM6IDwvZW0+CiAgICBw
dWIgZm4gcmVhZCgmYW1wO3NlbGYsIG9mZnNldDogaHdhZGRyLCBfc2l6ZTogdTMyKSAtJmd0OyB1
NjQgewogICAgICAgIGxldCBtdXQgcmVncyA9IHNlbGYucmVncy5ib3Jyb3dfbXV0KCk7CgoKICAg
ICAgICBsZXQgcmVzdWx0ID0gbWF0Y2ggUmVnaXN0ZXJPZmZzZXQ6OnRyeV9mcm9tKG9mZnNldCkg
ewogICAgICAgICAgICBFcnIodikgaWYgKDB4M2Y4Li4weDQwMCkuY29udGFpbnMoJmFtcDsodiAm
Z3Q7Jmd0OyAyKSkgPSZndDsgewogICAgICAgICAgICAgICAgbGV0IGRldmljZV9pZCA9IHNlbGYu
Z2V0X2NsYXNzKCkuZGV2aWNlX2lkOwogICAgICAgICAgICAgICAgcmV0dXJuIHU2NDo6ZnJvbShk
ZXZpY2VfaWRbKG9mZnNldCAtIDB4ZmUwKSAmZ3Q7Jmd0OyAyXSkKICAgICAgICAgICAgfQoKICAg
ICAgICAgICAgRXJyKF8pID0mZ3Q7IHsKICAgICAgICAgICAgICAgIC8vIHFlbXVfbG9nX21hc2so
TE9HX0dVRVNUX0VSUk9SLCAmcXVvdDtwbDAxMV9yZWFkOiBCYWQgb2Zmc2V0IDB4JXhcbiZxdW90
OywgKGludClvZmZzZXQpOwogICAgICAgICAgICAgICAgcmV0dXJuIDAKICAgICAgICAgICAgfQog
ICAgICAgICAgICBPayhmaWVsZCkgPSZndDsgcmVncy5yZWFkKGZpZWxkKSwKICAgICAgICB9OwoK
ICAgICAgICBtYXRjaCByZXN1bHQgewogICAgICAgICAgICBDb250cm9sRmxvdzo6QnJlYWsodmFs
dWUpID0mZ3Q7IHZhbHVlLmludG8oKSwKICAgICAgICAgICAgQ29udHJvbEZsb3c6OkNvbnRpbnVl
KHZhbHVlKSA9Jmd0OyB7CiAgICAgICAgICAgICAgICBzZWxmLnVwZGF0ZSgpOwogICAgICAgICAg
ICAgICAgc2VsZi5jaGFyX2JhY2tlbmQuYWNjZXB0X2lucHV0KCk7CiAgICAgICAgICAgICAgICB2
YWx1ZS5pbnRvKCkKICAgICAgICAgICAgfSwKICAgICAgICB9CiAgICB9CgogICAgPGVtPi8vIHBh
cnQgb2YgcGwwMTFfd3JpdGUgaW4gQzogPC9lbT4KICAgIHB1YiBmbiB3cml0ZSgmYW1wO3NlbGYs
IG9mZnNldDogaHdhZGRyLCB2YWx1ZTogdTY0LCBfc2l6ZTogdTMyKSB7CiAgICAgICAgbGV0IG11
dCByZWdzID0gc2VsZi5yZWdzLmJvcnJvd19tdXQoKTsKICAgICAgICBpZiBsZXQgT2soZmllbGQp
ID0gUmVnaXN0ZXJPZmZzZXQ6OnRyeV9mcm9tKG9mZnNldCkgewogICAgICAgICAgICBpZiByZWdz
LndyaXRlKGZpZWxkLCB2YWx1ZSBhcyB1MzIsICZhbXA7c2VsZi5jaGFyX2JhY2tlbmQpIHsKICAg
ICAgICAgICAgICAgIHNlbGYudXBkYXRlKCk7CiAgICAgICAgICAgIH0KICAgICAgICB9IGVsc2Ug
ewogICAgICAgICAgICBlcHJpbnRsbiEoJnF1b3Q7d3JpdGUgYmFkIG9mZnNldCB7b2Zmc2V0fSB2
YWx1ZSB7dmFsdWV9JnF1b3Q7KTsKICAgICAgICB9CiAgICB9CgogICAgcHViIGZuIHJlYWxpemUo
JmFtcDtzZWxmKSB7CiAgICAgICAgc2VsZi5jaGFyX2JhY2tlbmQuZW5hYmxlX2hhbmRsZXJzKHNl
bGYpOwogICAgfQoKCgoKCiAgICA8ZW0+Ly8gcGFydCBvZiBwbDAxMV9yZXNldCBpbiBDOiA8L2Vt
PgogICAgcHViIGZuIHJlc2V0KCZhbXA7c2VsZikgewogICAgICAgIHNlbGYucmVncy5ib3Jyb3df
bXV0KCkucmVzZXQoKTsKICAgIH0KCiAgICA8ZW0+Ly8gcGFydCBvZiBwbDAxMV9wb3N0X2xvYWQg
aW4gQzogPC9lbT4KICAgIHB1YiBmbiBwb3N0X2xvYWQoJmFtcDtzZWxmLCBfdmVyc2lvbl9pZDog
dTMyKSAtJmd0OyBSZXN1bHQmbHQ7KCksICgpJmd0OyB7CiAgICAgICAgc2VsZi5yZWdzLmJvcnJv
d19tdXQoKS5wb3N0X2xvYWQoKQogICAgfQoKICAgIHB1YiBmbiB1cGRhdGUoJmFtcDtzZWxmKSB7
CiAgICAgICAgbGV0IHJlZ3MgPSBzZWxmLnJlZ3MuYm9ycm93KCk7CiAgICAgICAgbGV0IGZsYWdz
ID0gcmVncy5pbnRfbGV2ZWwgJmFtcDsgcmVncy5pbnRfZW5hYmxlZDsKICAgICAgICBmb3IgKGly
cSwgaSkgaW4gc2VsZi5pbnRlcnJ1cHRzLml0ZXIoKS56aXAoSVJRTUFTSykgewogICAgICAgICAg
ICBpcnEuc2V0KGZsYWdzICZhbXA7IGkgIT0gMCk7CiAgICAgICAgfQogICAgfQp9CgoKLy8vICMg
U2FmZXR5Ci8vLwovLy8gV2UgZXhwZWN0IHRoZSBGRkkgdXNlciBvZiB0aGlzIGZ1bmN0aW9uIHRv
IHBhc3MgYSB2YWxpZCBwb2ludGVyIGZvciBgY2hyYAovLy8gYW5kIGBpcnFgLgojW25vX21hbmds
ZV0KcHViIHVuc2FmZSBleHRlcm4gJnF1b3Q7QyZxdW90OyBmbiBwbDAxMV9jcmVhdGUoCiAgICBh
ZGRyOiB1NjQsCiAgICBpcnE6ICptdXQgSVJRU3RhdGUsCiAgICBjaHI6ICptdXQgQ2hhcmRldiwK
KSAtJmd0OyAqbXV0IERldmljZVN0YXRlIHsKICAgIC8vIFNBRkVUWTogVGhlIGNhbGxlcnMgcHJv
bWlzZSB0aGF0IHRoZXkgaGF2ZSBvd25lZCByZWZlcmVuY2VzLgogICAgLy8gcGwwMTFfY3JlYXRl
IGRvZXMgbm90IHJlbGVhc2UgdGhlbS4KICAgIGxldCBpcnEgPSB1bnNhZmUgeyBNYW51YWxseURy
b3A6Om5ldyhPd25lZDo6Jmx0O0lSUVN0YXRlJmd0Ozo6ZnJvbV9yYXcoaXJxKSkgfTsKICAgIGxl
dCBjaHIgPSB1bnNhZmUgeyBNYW51YWxseURyb3A6Om5ldyhPd25lZDo6Jmx0O0NoYXJkZXYmZ3Q7
Ojpmcm9tX3JhdyhjaHIpKSB9OwoKICAgIGxldCBkZXYgPSBQTDAxMVN0YXRlOjpuZXcoKTsKICAg
IGRldi5wcm9wX3NldF9jaHIoJnF1b3Q7Y2hhcmRldiZxdW90OywgJmFtcDtjaHIpOwogICAgZGV2
LnJlYWxpemUoKTsKICAgIGRldi5tbWlvX21hcCgwLCBhZGRyKTsKICAgIGRldi5jb25uZWN0X2ly
cSgwLCAmYW1wO2lycSk7CgogICAgT3duZWQ6OmludG9fcmF3KGRldi51cGNhc3QoKSkKfQoKI1ty
ZXByKEMpXQojW2Rlcml2ZShxZW11X2FwaV9tYWNyb3M6Ok9iamVjdCldCiNbcGluX2RhdGFdCi8v
LyBQTDAxMSBMdW1pbmFyeSBkZXZpY2UgbW9kZWwuCnB1YiBzdHJ1Y3QgUEwwMTFMdW1pbmFyeSB7
CiAgICAjW3Bpbl0KICAgIHBhcmVudF9vYmo6IFBMMDExU3RhdGUsCn0KCmltcGwgT2JqZWN0SW1w
bCBmb3IgUEwwMTFMdW1pbmFyeSB7CiAgICB0eXBlIFBhcmVudFR5cGUgPSBQTDAxMVN0YXRlOwoK
ICAgIGZuIGluc3RhbmNlX2luaXQocGFyZW50X2luaXQ6IGltcGwgUGluSW5pdCZsdDtQTDAxMVN0
YXRlJmd0OykgLSZndDsgaW1wbCBQaW5Jbml0Jmx0O1NlbGYmZ3Q7IHsKICAgICAgICBwaW5faW5p
dCEoUEwwMTFMdW1pbmFyeSB7CiAgICAgICAgICAgIHBhcmVudF9vYmogJmx0Oy0gcGFyZW50X2lu
aXQKICAgICAgICB9KQogICAgfQp9CgppbXBsIENsYXNzSW5pdEltcGwmbHQ7UEwwMTFDbGFzcyZn
dDsgZm9yIFBMMDExTHVtaW5hcnkgewogICAgZm4gY2xhc3NfaW5pdChrbGFzczogJmFtcDttdXQg
UEwwMTFDbGFzcykgewogICAgICAgIGtsYXNzLmRldmljZV9pZCA9IERldmljZUlkOjpMVU1JTkFS
WTsKICAgICAgICAmbHQ7U2VsZiBhcyBDbGFzc0luaXRJbXBsJmx0O1N5c0J1c0RldmljZUNsYXNz
Jmd0OyZndDs6OmNsYXNzX2luaXQoJmFtcDttdXQga2xhc3MucGFyZW50X2NsYXNzKTsKICAgIH0K
fQoKcW9tX2lzYSEoUEwwMTFMdW1pbmFyeSA6IFBMMDExU3RhdGUsIFN5c0J1c0RldmljZSwgRGV2
aWNlU3RhdGUsIE9iamVjdCk7Cgp1bnNhZmUgaW1wbCBPYmplY3RUeXBlIGZvciBQTDAxMUx1bWlu
YXJ5IHsKICAgIHR5cGUgQ2xhc3MgPSAmbHQ7UEwwMTFTdGF0ZSBhcyBPYmplY3RUeXBlJmd0Ozo6
Q2xhc3M7CiAgICBjb25zdCBUWVBFX05BTUU6ICZhbXA7JiMzOTtzdGF0aWMgQ1N0ciA9IGNyYXRl
OjpUWVBFX1BMMDExX0xVTUlOQVJZOwp9CgppbXBsIERldmljZUltcGwgZm9yIFBMMDExTHVtaW5h
cnkge308L2NvZGU+PC9wcmU+CjwvdGQ+PHRkPjxwcmUgc3R5bGU9ImNvbG9yOiBibHVlOyI+CgoK
CgoKCgoKClRoZXNlIGFyZSB0aGUgQVBJcyB0aGF0IFBMMDExIG5lZWRzLiAgTm90ZSB0aGF0ICJi
aW5kaW5ncyIgaXMgbm90CmltcG9ydGVkLCBhbGwgdGhhdCBpcyBuZWNlc3NhcnkgZnJvbSBDIGNv
ZGUgaGFzIGJlZW4gd3JhcHBlZC4KCgoicHJlbHVkZSIgcHJvdmlkZXMgc29tZSBjb21tb25seSB1
c2VkIHN0cnVjdHMgYW5kIHRyYWl0cyBmcm9tIGFsbCBvdmVyIHRoZSBwbGFjZS4KCgoKInFvbV9p
c2EiIGlzIGEgbWFjcm8gdGhhdCBoZWxwcyB3aXRoIGRlZmluaW5nIFFPTSBzdXBlcmNsYXNzZXMu
CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgpSdXN0IG9ubHkgYWxsb3dzIGluZGV4aW5nIGFycmF5
cyB3aXRoIHVzaXplIGluZGljZXMuICBBZGRpbmcKdGhlIEluZGV4IGltcGxlbWVudGF0aW9uIGhl
cmUgcmVtb3ZlcyBzb21lIGNhc3RzIGVsc2V3aGVyZS4KCgoKCgoKRXF1aXZhbGVudCBjb2RlIGlz
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IHRoZSBSdXN0IGNvbXBpbGVyCih3aXRoICIjW2Rl
cml2ZShEaXNwbGF5KV0iIG9uIHRoZSBSZWdpc3Rlck9mZnNldHMgZW51bSkuCgoKCgoKCgoKCgoK
CgoKCgpJIGFtIG5vdCB2ZXJ5IGhhcHB5IHdpdGggdGhlIGhhbmRsaW5nIG9mIGJpdG1hc2tzLiAg
SXQgaXMgY2VydGFpbmx5CnBvc3NpYmxlIHRvIGRvIGJldHRlci4gIFRoZSAiLjAiIGlzIGJlY2F1
c2UgdGhlIGNvZGUgdHJpZXMgdG8gdXNlIGEKdHlwZSB3cmFwcGluZyB0aGUgYml0ZmllbGRzLCBi
dXQgbm90IGhhcmQgZW5vdWdoIChpcnFfbGV2ZWwsIGlycV9lbmFibGUsCklSUU1BU0sgYXJlIGFs
bCB1MzIpLgoKUnVzdCBzdXBwb3J0cyBvcGVyYXRvciBvdmVybG9hZGluZywgYnV0IG5vdCB5ZXQg
aW4gImNvbnN0IiBjb250ZXh0ICh3aGljaAppbmNsdWRlcyAiY29uc3QiIGRlY2xhcmF0aW9ucyBv
ZiBjb3Vyc2UsIGJ1dCBhbHNvICJzdGF0aWMiIGRlY2xhcmF0aW9ucykuClRoaXMgaXMgdGhlIG1h
aW4gbWlzc2luZyBiaXQgdGhhdCBJIHdvdWxkIGxpa2UgZnJvbSB0aGUgbGFuZ3VhZ2UuClVudGls
IGl0J3MgaW4sIHdlJ2xsIHByb2JhYmx5IGhhdmUgdG8gYmUgY3JlYXRpdmUuCgoKCgoKCk5lZWRl
ZCBmb3IgbWlncmF0aW9uIHRvIGxvb2sgYXQgdGhlIHN0cnVjdC4KCgpUaGVzZSBhcmUgZWZmZWN0
aXZlbHkgYml0ZmllbGRzLCBidXQgcG9ydGFibGUuICBUaGV5IGFyZSBoYW5kbGVkIGJ5IGFuCmV4
dGVybmFsIGNyYXRlLiAgVGhlIHVnbHktaXNoIHBhcnQgYWJvdXQgaXQgaXMgdGhhdCBpdCBkb2Vz
bid0IHN1cHBvcnQKY29uc3Qgb3BlcmF0aW9uIHZlcnkgd2VsbCwgc28gaXQgaXMgaGFyZCB0byBk
ZWZpbmUgY29uc3RhbnRzIGZvciByZWN1cnJpbmcKdmFsdWVzIG9mIHRoZSByZWdpc3RlcnMgKGUu
Zy4gRFJfQkUgaW4gdGhlIEMgY29kZSkuCgoKCnJlYWRfZmlmbyBjb3VsZCBiZSBhIFtyZWdpc3Rl
cnM6OkRhdGE7IFBMMDExX0ZJRk9fREVQVEhdIHRvby4gIE5vdCBzdXJlCmhvdyB0aGF0IHdvdWxk
IHdvcmsgZm9yIHZtc3RhdGUsIHRob3VnaC4KCk5vdGUgaG93IHRoZSBtdXRhYmxlIHBhcnQgb2Yg
dGhlIGRldmljZSBpcyBpbiBhIHNlcGFyYXRlIHN0cnVjdC4gIFRoaXMgaXMKYmVjYXVzZSBhbGwg
YWNjZXNzZXMgY2hlY2sgdGhhdCB0aGUgQlFMIGlzIHRha2VuLCBhbmQgYWxzbyB0aGF0IGl0IGlz
Cm5vdCBkcm9wcGVkIGluIHRoZSBtaWRkbGUgb2YgdGhlIGFjY2Vzcy4KCgoKCgoKCgoKCgoKCgoK
VGhpcyBpcyB3aGF0IGRvZXMgdGhlIEJRTCBjaGVja3MuCgpPd25lZDw+IG1lYW5zIHRoYXQgaW5z
dGFuY2VfaW5pdCB3aWxsIGFkZCBhIHJlZmVyZW5jZSB0byB0aGUgQ2xvY2sgYW5kCmluc3RhbmNl
X2ZpbmFsaXplIHdpbGwgZHJvcCBpdC4KCgpBbGwgc3VwZXJjbGFzc2VzIGhhdmUgdG8gYmUgbGlz
dGVkLCBhdCBsZWFzdCBmb3Igbm93LgoKSSB0b29rIGEgc2xpZ2h0bHkgZGlmZmVyZW50IGFwcHJv
YWNoIHRvIHRoZSBkZXZpY2VfaWQsIGNvbXBhcmVkIHRvIHRoZQpDIGNvZGUsIG1vc3RseSB0byB0
ZXN0IHdoZXRoZXIgdGhlIGJpbmRpbmdzIHRvIFFPTSBjb3VsZCBkbyBzdWJjbGFzc2VzCm9mIGNs
YXNzZXMgdGhhdCB3cml0dGVuIHRoZW1zZWx2ZXMgaW4gUnVzdC4KCgoKVGhlc2UgInVuc2FmZSBp
bXBsIiBhcmUgdGhlIG9ubHkgb2NjdXJyZW5jZSBvZiB1bnNhZmUgaW4gdGhlIHdob2xlIGRldmlj
ZS4KVGhlIE9iamVjdFR5cGUgdHJhaXQgaXMgbWFya2VkIHVuc2FmZSBiZWNhdXNlIGl0IHRlbGxz
IHRoZSBRT00gQyBjb2RlCnRoaW5ncyBhYm91dCB0aGUgbGF5b3V0IG9mIHRoZSBQTDAxMVN0YXRl
IHN0cnVjdCB0aGF0IHRoZSB1c2VyIGlzIHByb21pc2luZy4KT2Z0ZW4sIHVuc2FmZSB0cmFpdHMg
YXJlIGdlbmVyYXRlZCBieSBtYWNyb3MgdGhhdCBjYW4gcHJvbWlzZSBzYWZldHkuCgoKCgpBcyB3
aWxsIGJlIHZpc2libGUgbGF0ZXIsIGltcGxlbWVudGluZyBjbGFzc19pbml0IGZvciAic3RhbmRh
cmQiIGNsYXNzZXMKaXMgbW9zdGx5IGF1dG9tYXRpYywgYnV0IHlvdSBkbyBoYXZlIHRvIHJlY3Vy
c2UgdXAgdGhlIGNsYXNzIGhpZXJhcmNoeS4KCgpUaGlzIHRyYWl0IGRlZmluZXMgd2hhdCBnb2Vz
IGluIFR5cGVJbmZvLgoKClNvIGZvciBleGFtcGxlIHRoaXMgZW5kcyB1cCBpbiB0aGUgVHlwZUlu
Zm8ncyAuaW5zdGFuY2VfcG9zdF9pbml0IGZpZWxkLgoKClRoaXMgIkJ1aWxkZXIiIHRoaW5nIGlz
IGEgY29tbW9uIGlkaW9tIGluIFJ1c3Qgd2hlbmV2ZXIgbm90IGFsbCBmaWVsZHMKYXJlIGFsd2F5
cyBpbml0aWFsaXplZC4gIE5vdGUgdGhhdCB0aGUgTWVtb3J5UmVnaW9uT3BzIGNhbGxiYWNrcyBh
cmUKbWV0aG9kcyBpbXBsZW1lbnRlZCBieSBzdHJ1Y3QgUEwwMTFTdGF0ZS4KCgoKClJ1c3QgY29k
ZSB3aWxsIGhhdmUgYSBzdHJpY3RlciBzZXBhcmF0aW9uIGJldHdlZW4gaW5zdGFuY2VfaW5pdCBh
bmQKaW5zdGFuY2VfcG9zdF9pbml0LiAgVGhlIGZvcm1lciBvbmx5IHRha2VzIGNhcmUgb2YgaW5p
dGlhbGl6aW5nIHRoZSBzdHJ1Y3QKKHRoZSBjb21waWxlciBjaGVja3MgdGhhdCBhbGwgZmllbGRz
IGFyZSBpbml0aWFsaXplZCEpLCB0aGUgbGF0dGVyIGRvZXMKb3RoZXIgaW5pdGlhbGl6YXRpb24g
c3VjaCBhcyBzeXNidXNfaW5pdF9pcnEgYW5kIHN5c2J1c19pbml0X21taW8uCgoKCgoKCgoKCgoK
CgpUaGlzIHRyYWl0IGRlZmluZXMgd2hhdCBnb2VzIGluIERldmljZUNsYXNzLgpUaGlzIGNhbiBi
ZWNvbWUgYSAiY29uc3QiIHdpdGggYSBuZXdlciB2ZXJzaW9uIG9mIFJ1c3QuCgoKClRoaXMgb25l
IHRvby4KCgpSZWFsaXplIGFuZCByZXNldCBjYW5ub3QgYmUgZnVuY3Rpb25zIGluIHRoZSBEZXZp
Y2VJbXBsIHRyYWl0LCBiZWNhdXNlCnRoZSBjb2RlIGFsc28gbmVlZHMgdG8gZXhwcmVzcyB0aGVp
ciAqYWJzZW5jZSogKGkuZS4gdXNpbmcgdGhlIGluaGVyaXRlZAppbXBsZW1lbnRhdGlvbikuICBJ
dCBtYXkgYmUgcG9zc2libGUgaW4gdGhlIGZ1dHVyZSB0byB1c2UgcHJvY2VkdXJhbAptYWNyb3Mg
dG8gbWFrZSB0aGluZ3MgbG9vayBhIGJpdCBtb3JlIG5hdHVyYWwuICBCdXQgdGhpcyBpcyBhdCB0
aGUgY29zdApvZiBoaWRkZW4gbWFnaWMsIHNvIGl0IGlzIGEgZGViYXRhYmxlIGJlbmVmaXQgYW5k
IGZvciBub3cgSSBhbSBsZWF2aW5nCmV2ZXJ5dGhpbmcgdmlzaWJsZS4KCgoKSGVyZSBJIGFtIHRh
a2luZyBhIHNsaWdodGx5IGRpZmZlcmVudCBhcHByb2FjaCB0byBjYWxsYmFja3M7CnRoZXkgYXJl
IGFsbCBpbmNsdWRlZCBpbiBhIHRyYWl0IGluc3RlYWQgb2YgYmVpbmcgbWV0aG9kcwppbXBsZW1l
bnRlZCBieSBQTDAxMVN0YXRlLiAgVGhlIHJlYXNvbiBmb3IgdGhpcyBpcyBvbmx5IHRvCmZpZ3Vy
ZSBvdXQgdGhlIGFkdmFudGFnZXMgYW5kIGRpc2FkdmFudGFnZXM7IHRoaXMgb25lIHNlZW1zCm1v
cmUgIm5hdHVyYWwiIGJ1dCBpZiBvbmUgaGFzIG1vcmUgdGhhbiBvbmUgY2hhcmFjdGVyIGRldmlj
ZQpiYWNrZW5kIHRoaW5ncyB3aWxsIGdldCBtb3JlIGNvbXBsaWNhdGVkLiAgSSBhbSBsZWFuaW5n
CnRvd2FyZHMgdXNpbmcgbWV0aG9kcyBmb3IgY2hhcmFjdGVyIGRldmljZSBvcHMgYXMgd2VsbCwg
d2hpY2gKaXMgYWxzbyBtb3JlIHNpbWlsYXIgdG8gdGhlIEMgQVBJLiAgSSBzdGFydGVkIHdpdGgg
dGhpcyBvdGhlcgppZGVhIGJ1dCBvbmx5IGJlY2F1c2UgSSBoYWRuJ3QgeWV0IGZpZ3VyZWQgb3V0
IG1ldGhvZHMuCgoKCgpEdWUgdG8gdGhlIHNlcGFyYXRpb24gYmV0d2VlbiByZWdpc3RlcnMgYW5k
IHRoZSByZXN0LCBJCnJlbW92ZWQgZXh0ZXJuYWwgaW50ZXJydXB0IHVwZGF0ZSBmcm9tIHB1dF9m
aWZvIChhbmQgbWFkZQppdCAjW211c3RfdXNlXSB0byBub3QgZm9yZ2V0KS4KCgoKCgoKCgoKCgoK
CgoKClRoZSBidWxrIG9mIHJlYWQgYW5kIHdyaXRlIGlzIGltcGxlbWVudGVkIG9uIFBMMDExUmVn
aXN0ZXJzLiAgcmVhZCBtdXN0CmFsc28gcmV0dXJuIHdoZXRoZXIgdG8gaW52b2tlIHFlbXVfY2hy
X2ZlX2FjY2VwdF9pbnB1dCgpIGJlY2F1c2UgaXQgY2FuCmNhdXNlIHJlZW50cmFuY3kgaW4gUEww
MTFSZWdpc3RlcnMgKHdoaWNoIGlzIGFuIGFib3J0ISkuICAiQ29udHJvbEZsb3ciCmlzIGhvdyB0
aGUgY29kZSBjdXJyZW50bHkgcmVwcmVzZW50cyBpdCwgYnV0IGl0J3MgcHJvYmFibHkgZWFzaWVz
dCB0bwpyZXR1cm4gYSAoYm9vbCwgdTMyKSBwYWlyLiAgUGF0Y2hlcyBhcmUgd2VsY29tZS4KCkhl
cmUgYXJlIGJpdGZpZWxkcyBpbiBhY3Rpb24uCgoKCgoKCgoKCgoKCkFub3RoZXIgY2FzZSBpbiB3
aGljaCBiaXRtYXNrcyBuZWVkIG1vcmUgd29yay4KCgpUaGUgUlNSIGxheW91dCBpcyB0aGUgc2Ft
ZSBhcyBiaXRzIDgtMTUgb2YgRFIuICBUaGlzIGlzIHZpc2libGUgaW4KdGhlIHR5cGVzLiAgSW5j
bHVkaW5nIHRoZSAiZXJyb3IgY2xlYXIiIHBhcnQgaW4gdGhlIG5hbWUgaXMgcHJvYmFibHkKd3Jv
bmcgYmVjYXVzZSB0aGUgcmVnaXN0ZXIgaXMgb25seSB1c2VkIGZvciB0aGUgcmVhZHMgcGFydC4g
IEl0J3MKbm90IGEgIndyaXRlIDEgY2xlYXJzIiByZWdpc3RlcnMsIGZvciBleGFtcGxlLiAgVGhp
cyBicmluZ3MgYW5vdGhlcgpxdWVzdGlvbjogd2hhdCBpcyB0aGUgYmVzdCB3YXkgdG8gbm90ZSBv
cGVuIGltcHJvdmVtZW50cyBpbiB0aGUgZmlsZXM/CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgpBZ2FpbiBzb21lIGRpZmZlcmVuY2VzIGR1ZSB0byByZWFk
IGFuZCB3cml0ZSBiZWluZyBpbXBsZW1lbnRlZCBvbiBhCnNlcGFyYXRlIHN0cnVjdDoKCi0gcmVh
ZC93cml0ZSBnZXRzIHRoZSByZWdpc3RlciBkZWNvZGVkIGludG8gYW4gZW51bQoKLSB3cml0ZSBz
ZW5kIGJhY2sgd2hldGhlciB0byBsb29rIGZvciBpbnRlcnJ1cHRzCgotIHdyaXRlIGFsc28gbmVl
ZHMgdG8ga25vdyB0aGUgY2hhcmFjdGVyIGJhY2tlbmQuICBBbHRlcm5hdGl2ZWx5CiAgUEwwMTFS
ZWdpc3RlcnMgY291bGQga25vdyBpdHMgb3V0ZXIgUEwwMTFTdGF0ZSwgb3IKICAiY2hhcl9iYWNr
ZW5kLndyaXRlX2FsbCgmY2gpOyIgY291bGQgYmUgc2VudCBkb3duIGFzIGEKICBjbG9zdXJlCgoK
CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKCgpUaGlzICNbbXVzdF91c2VdIGFza3MgdGhlIGNhbGxlciB0byBjaGVjayB0
aGUgcmVzdWx0ICh0byBjYWxsCnVwZGF0ZSgpIG9yIHRvIHBhc3MgaXQgdXApLgoKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgpUaGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IGJpdGZpZWxkcyBoZXJlIGFuZCBpbnRzIGJlbG93IGlzIGEgYml0IGphcnJpbmcuCkkgZ3Vlc3Mg
aWYgb25lIGRvZXNuJ3QgbGlrZSBpdCwgdGhleSBjb3VsZCB1c2UgdTMyIGxpa2UgaW4gQyBmb3Ig
Ym90aApyZWdpc3RlcnMgYW5kIGludGVycnVwdHM7IG5vYm9keSB3b3VsZCBjb21wbGFpbiB0byBi
ZSBob25lc3QuICBVc2luZyB0aGUKbGFuZ3VhZ2UncyBmZWF0dXJlcyBtYWtlcyBpdCBjbGVhciB3
aGVyZSB0aGV5IGxlYXZlIHNvbWV0aGluZyB0byBiZQpkZXNpcmVkLCBhdCBsZWFzdCAoYW5kIEkg
ZG9uJ3QgZmVlbCBsaWtlIHVuZG9pbmcgdGhlIHdvcmsgdGhhdCBNYW5vcwpkaWQgaW4gY29udmVy
dGluZyB0aGUgcmVnaXN0ZXJzIHRvIGJpdGZpZWxkcy4uLikuCgoKCgoKCgoKCgoKCgoKCgoKCgoK
CgoKCgoKCgoKVGhpcyBpcyBzdGlsbCB0aGUgaW1wbGVtZW50YXRpb24gb2YgUEwwMTFSZWdpc3Rl
cnMuCgoKCgoKCgoKCgoKCkFuZCB0aGlzIGFzIHdlbGwuICBUaGlzIGlzICpub3QqIHRoZSByZXNl
dCBtZXRob2Qgb24gRGV2aWNlU3RhdGUuCgoKCgoKCgoKCgoKCgoKVGhpcyBsaW5lIHJlc2V0cyBh
bGwgRklGTyBmbGFncywgYm90aCB0cmFuc21pdCBhbmQgcmVjZWl2ZS4KCgoKCgoKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKCgoKCkFub3RoZXIgI1ttdXN0X3VzZV0gaGVyZS4KCgoKCgoKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKClRoaXMgaXMgdGhlIGNhbGxiYWNr
IGZvciBzZWxmLmNsb2NrCgoKCgoKVGhpcyB3YXMgdGhlIG1pc3NpbmcgcGFydCBvZiBwbDAxMV9p
bml0LiAgQlRXLCB2bXN0YXRlIGlzCnRoZSBtYWluIG1pc3NpbmcgcGFydC4KCgoKCgoKQW5kIGhl
cmUgYXJlIGFsc28gdGhlIHJlbWFpbmluZyBwYXJ0cyBvZiByZWFkIGFuZCB3cml0ZS4KCkFmdGVy
IGJvcnJvd19tdXQoKSwgInJlZ3MiIHByb3ZpZGVzIGEgd2F5IHRvIHdyaXRlIHRvIHNlbGYucmVn
cywKYnV0IG9ubHkgd2hpbGUgdGhlIGxvY2FsIHZhcmlhYmxlIHJlZ3MgaXMgbGl2ZS4KCkNvbnZl
cnRpbmcgZnJvbSBod2FkZHIgdG8gZW51bSByZXR1cm5zIEVycihvZmZzZXQpIGlmIHRoZSBvZmZz
ZXQgaXMKbm90IHBhcnQgb2YgYSBrbm93biByZWdpc3Rlci4gIFRoaXMgaXMgb25lIGNhc2Ugd2hl
cmUgbWFjcm9zIGFyZSBnb29kCmF0IGhpZGluZyBjb2RlIHRoYXQgImRvZXMgdGhlIG9idmlvdXMg
dGhpbmciLiAgUnVzdCBtYWNyb3MgYXJlIG1vcmUKcG93ZXJmdWwgYW5kIGdlbmVyYWxseSBkbyBu
b3QgaGF2ZSB0aGUgc2FtZSBpc3N1ZXMgYXMgQywgYnV0IHRoZXkgY2FuCm1ha2UgdGhlIGNvZGUg
dW5yZWFkYWJsZSBpZiBkb25lIHdyb25nLgoKCkxvZ2dpbmcgYW5kIHRyYWNpbmcgYXJlIHRoZSBt
YWluIG1pc3NpbmcgcGllY2VzLgoKCgpyZWdzIGlzIGRyb3BwZWQgaGVyZS4gIFNvbWVvbmUgZWxz
ZSBjYW4gbm93IHdyaXRlIHRvIHNlbGYucmVncy4KCkFnYWluLCBkb24ndCByZWFkIHRvbyBtdWNo
IGluIEJyZWFrL0NvbnRpbnVlLiAgVGhlIGludGVudGlvbiBvZgp0aGUgQ29udHJvbEZsb3cgZW51
bSBkb2Vzbid0IHJlYWxseSBtYXRjaCBob3cgUUVNVSB1c2VzIGl0IGhlcmUuCgphY2NlcHRfaW5w
dXQgaXMgY2FsbGVkIGFmdGVyIGNvbWluZyBiYWNrOyB0aGUgY2hhcmFjdGVyIGRldmljZQpjYWxs
YmFja3MgZG8gdGhlaXIgb3duIGJvcnJvd19tdXQoKS4KCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoK
ClBMMDExU3RhdGUgbmVlZHMgYSBjb3VwbGUgbW9yZSBmb3J3YXJkaW5nIG1ldGhvZHMgdG8gY2Fs
bCBpbnRvIFBMMDExUmVnaXN0ZXJzLgpJbiBmYWN0LCAqdGhpcyogaXMgdGhlIGltcGxlbWVudGF0
aW9uIG9mIHRoZSAicmVzZXQiIG1ldGhvZCBpbiBEZXZpY2VTdGF0ZS4KCgoKCgoKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKVGhlIHdyYXBwZXJzIGZvciBxZGV2X3Byb3Bfc2V0X2NociBhbmQgc3lzYnVz
X2Nvbm5lY3RfaXJxIHRha2UgYW4KT3duZWQ8Li4uPiBzbWFydCBwb2ludGVyLiAgVGhpcyBzbWFy
dCBwb2ludGVyIGF1dG9tYXRpY2FsbHkgaGFuZGxlcwpvYmplY3RfcmVmKCkgYW5kIG9iamVjdF91
bnJlZigpLiAgVGhlIHJlYXNvbiB3aHkgdGhleSB0YWtlIE93bmVkPC4uLj4gYW5kCm5vdCBhIG5v
cm1hbCByZWZlcmVuY2UgaXMgdG8gc2lnbmlmeSB0aGF0IHRoZSBvYmplY3QgaXMgaGVhcCBhbGxv
Y2F0ZWQuClNpbmNlIEMgZ2F2ZSBhIHJhdyBwb2ludGVyLCBjcmVhdGUgdGhlIE93bmVkIGJ5IGhh
bmQgaW4gdW5zYWZlIGJsb2Nrcy4KQWxzbyB0ZWxsIFJ1c3Qgbm90IHRvIGRyb3AgaXQsIGkuZS4g
bm90IHRvIGNhbGwgb2JqZWN0X3VucmVmKCkuCgouLi4gSSBsaWVkLCB0aGUgZnVuY3Rpb25zIHRh
a2UgKmEgcmVmZXJlbmNlKiB0byB0aGUgcG9pbnRlciAodGhhdCBpcywgYW4KJk93bmVkPC4uLj4p
LiAgVGhpcyBtZWFucyB0aGF0IHRoZXkgKnJlcXVlc3QqIHlvdSB0byBvd24gYSByZWZlcmVuY2Ug
YnV0CnRoZXkgZG9uJ3Qgc3RlYWwgaXQgZnJvbSB5b3UuICBUaGUgZnVuY3Rpb25zIHRha2UgY2Fy
ZSBvZiBhZGRpbmcgdGhlaXIgb3duCnJlZmVyZW5jZTogcWVtdV9jaHJfZmVfaW5pdCgpIGRvZXMg
aXQ7IG9yLCBpZiBJJ20gbm90IHdyb25nLCBpdCBzaG91bGQpLgoKUEwwMTFTdGF0ZTo6bmV3KCkg
Z2F2ZSB1cyBhbiBPd25lZDxQTDAxMVN0YXRlPiwgY29udmVydGluZyBpdCB3aXRoIGludG9fcmF3
CmdpdmVzIG93bmVyc2hpcCBvZiB0aGUgcmVmZXJlbmNlIHRvIHRoZSBDIGNhbGxlci4KCgoKCgoK
CgoKCgoKCmluc3RhbmNlX2luaXQgaXMgbWFuZGF0b3J5IGluIFJ1c3Q7IHRoZSBjYXNlIHdoZXJl
IHlvdSBoYXZlIG5vIGFkZGl0aW9uYWwKZmllbGRzIHRvIGluaXRpYWxpemUgKGFzIGlzIHRoZSBj
YXNlIGhlcmUpIGlzIHJhcmUgZW5vdWdoLiAgVGhpcyBpcyB3aHkKaXQgaXMgYW4gImZuIiBhbmQg
bm90IGEgImNvbnN0IiBsaWtlIFJFQUxJWkUgYW5kIFJFU0VULiAgSWYgbmVlZGVkLCBpdAp3b3Vs
ZCBiZSBwb3NzaWJsZSB0byB3cml0ZSBhIHNlcGFyYXRlIHdyYXBwZXIgZm9yICJ0aGlzIGNsYXNz
IG9ubHkKZGlmZmVycyBmcm9tIGl0cyBzdXBlcmNsYXNzIGluIGl0cyBjbGFzc19pbml0IG1ldGhv
ZCIuCgoKQWdhaW4sIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBkaWZmZXJlbnQgc28gdGhpcyBpcyBh
IGNsYXNzX2luaXQgbWV0aG9kLgoKCgoKCgoKCgoKCgoKVGhlIGRlZmF1bHRzIGFyZSBnb29kLiBO
byBuZWVkIHRvIG92ZXJyaWRlIHJlYWxpemUgYW5kIHJlc2V0LCBzbyB0aGUgZGVmYXVsdCBvZgpO
b25lIGZvciB0aGUgUkVBTElaRSBhbmQgUkVTRVQgY29uc3RhbnRzIGFyZSBvay4KCnR5cGVfcmVn
aXN0ZXJfc3RhdGljIGlzIGhhbmRsZWQgYXV0b21hZ2ljYWxseSBieSAjW2Rlcml2ZShPYmplY3Qp
XSwKYXMgYW4gaW5pdGlhbCB0YXN0aW5nIG9mIHdoYXQgbWFjcm9zIGNvdWxkIGRvLiAgVGhlIG1h
aW4gdGhpbmdzIHRoYXQKd2UgY291bGQgZG8gd2l0aCBtYWNyb3MgaXMgaW1wbGVtZW50aW5nIHFk
ZXYgcHJvcGVydGllcyBpbiBhIHR5cGUtc2FmZQptYW5uZXIsIGFuZCBwZXJoYXBzIGltcHJvdmUg
dGhlIGJpdG1hc2sgc2l0dWF0aW9uLgo8L3ByZT48L3RkPjwvdHI+PC90YWJsZT4K
--------------i8WbTltGQZO00KKd01N0GZIs--


